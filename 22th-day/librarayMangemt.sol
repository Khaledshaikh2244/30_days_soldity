// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LibraryManagement {
    address public owner;
    
    struct Book {
        uint256 id;
        string title;
        string author;
        bool available;
    }

    mapping(uint256 => Book) public books;
    uint256 public bookCount;

    event BookAdded(uint256 id, string title, string author);
    event BookBorrowed(uint256 id);
    event BookReturned(uint256 id);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    modifier bookExists(uint256 id) {
        require(id > 0 && id <= bookCount, "Book does not exist");
        _;
    }

    modifier bookAvailable(uint256 id) {
        require(books[id].available, "Book is not available");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function addBook(string memory _title, string memory _author) external onlyOwner {
        bookCount++;
        books[bookCount] = Book(bookCount, _title, _author, true);
        emit BookAdded(bookCount, _title, _author);
    }

    function borrowBook(uint256 id) external bookExists(id) bookAvailable(id) {
        books[id].available = false;
        emit BookBorrowed(id);
    }

    function returnBook(uint256 id) external bookExists(id) {
        books[id].available = true;
        emit BookReturned(id);
    }
}
