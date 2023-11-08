// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Define the DEX contract
contract DecentralizedExchange {
    // Struct to represent orders
    struct Order {
        address user;
        uint256 amount;
        uint256 price;
        bool isBuyOrder;
    }

    // Order books for different trading pairs
    mapping(string => Order[]) public buyOrders;
    mapping(string => Order[]) public sellOrders;

    // User balances
    mapping(address => mapping(string => uint256)) public balances;

    // Event to log trades
    event Trade(
        address indexed buyer,
        address indexed seller,
        string tradingPair,
        uint256 amount,
        uint256 price
    );

    // Place a buy order
    function placeBuyOrder(string memory tradingPair, uint256 amount, uint256 price) public {
        Order memory order = Order(msg.sender, amount, price, true);
        buyOrders[tradingPair].push(order);
    }

    // Place a sell order
    function placeSellOrder(string memory tradingPair, uint256 amount, uint256 price) public {
        Order memory order = Order(msg.sender, amount, price, false);
        sellOrders[tradingPair].push(order);
    }

    // Execute trades
    function executeTrades(string memory tradingPair) public {
        Order[] storage buys = buyOrders[tradingPair];
        Order[] storage sells = sellOrders[tradingPair];

        // Implement a matching algorithm to execute trades

        // For simplicity, we'll assume a basic FIFO matching algorithm
        for (uint i = 0; i < buys.length; i++) {
            for (uint j = 0; j < sells.length; j++) {
                if (buys[i].price >= sells[j].price) {
                    // Execute the trade
                    uint256 amount = (buys[i].amount < sells[j].amount) ? buys[i].amount : sells[j].amount;

                    // Update user balances
                    balances[buys[i].user][tradingPair] += amount;
                    balances[sells[j].user][tradingPair] -= amount;

                    // Emit a trade event
                    emit Trade(buys[i].user, sells[j].user, tradingPair, amount, sells[j].price);

                    // Update order amounts
                    buys[i].amount -= amount;
                    sells[j].amount -= amount;

                    // Remove filled orders
                    if (buys[i].amount == 0) {
                        delete buys[i];
                    }
                    if (sells[j].amount == 0) {
                        delete sells[j];
                    }
                }
            }
        }
    }
}
