

pragma solidity ^0.4.17;
import './SafeMath.sol';
library FETCKeysCalcLong {
    using SafeMath for *;
    /**
     * @dev calculates number of keys received given X etc 
     * @param _curEth current amount of etc in contract 
     * @param _newEth etc being spent
     * @return amount of ticket purchased
     */
    function keysRec(uint256 _curEth, uint256 _newEth)
        internal
        pure
        returns (uint256)
    {
        return(keys((_curEth).add(_newEth)).sub(keys(_curEth)));
    }
    
    /**
     * @dev calculates amount of etc received if you sold X keys 
     * @param _curKeys current amount of keys that exist 
     * @param _sellKeys amount of keys you wish to sell
     * @return amount of etc received
     */
    function etcRec(uint256 _curKeys, uint256 _sellKeys)
        internal
        pure
        returns (uint256)
    {
        return((etc(_curKeys)).sub(etc(_curKeys.sub(_sellKeys))));
    }

    /**
     * @dev calculates how many keys would exist with given an amount of etc
     * @param _etc etc "in contract"
     * @return number of keys that would exist
     */
    function keys(uint256 _etc) 
        internal
        pure
        returns(uint256)
    {
        return ((((((_etc).mul(1000000000000000000)).mul(312500000000000000000000000)).add(5624988281256103515625000000000000000000000000000000000000000000)).sqrt()).sub(74999921875000000000000000000000)) / (156250000);
    }
    
    /**
     * @dev calculates how much etc would be in contract given a number of keys
     * @param _keys number of keys "in contract" 
     * @return etc that would exists
     */
    function etc(uint256 _keys) 
        internal
        pure
        returns(uint256)  
    {
        return ((78125000).mul(_keys.sq()).add(((149999843750000).mul(_keys.mul(1000000000000000000))) / (2))) / ((1000000000000000000).sq());
    }
}

