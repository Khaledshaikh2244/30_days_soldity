// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;


 contract verfyingVisiblity {
     //outsideworld
     function isPublic () public pure returns (bool){
         bool value = true;
        //  isprivate();==> no eror
         // isInternal();==> no eror
         //isExternal(); EROR
         return value;

         
     }

     //private ==> cant seen outside world
     // can be used inside contract 
     // here it can be called in  isPublic () func

       function isprivate () private  pure returns (bool){
         bool value = true;
         return value;
     }

     
     //Internal ==> cant seen outside world
     // can be used inside contract 
     // here it can be called in  isPublic () func

     function isInternal () internal pure returns (bool) {
          bool value = true;
         return value;
     }

        
     //Internal ==> can seen outside world like public
     // cant be used inside contract 
     // here it can not  be called in  isPublic () func

     function isExternal () external  pure returns (bool) {
          bool value = true;
         return value;
         
     }



      



 }

   //DERIVED CONTRACT 

        contract derivedContract is verfyingVisiblity {
          bool  public x = isInternal();
    
          
         
        }

        contract otherContract {
            verfyingVisiblity obj = new verfyingVisiblity();
            //calling of functions 

            bool x= obj.isExternal();//  ==>  true called
            // bool y = obj.isInternal(); // ==> cant be called 

            // bool z = obj.isprivate(); // cant be called 
 
        }