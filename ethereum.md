### Calldata

Empty calldata means call to receive() function.

https://solidity.readthedocs.io/en/latest/contracts.html#receive-ether-function


### Unused gas

Sent back to originator.

https://media.consensys.net/ethereum-gas-fuel-and-fees-3333e17fe1dc


### Modifying ether and gas for a function call

The ether and gas sent with a function call can be modified using .value() and .gas().

```
contract Sender {
  function send(address _receiver) payable {
    _receiver.call.value(msg.value).gas(20317)();
  }
}
```


https://medium.com/daox/three-methods-to-transfer-funds-in-ethereum-by-means-of-solidity-5719944ed6e9
https://ethereum.stackexchange.com/questions/6707/whats-the-difference-between-call-value-and-call-value


### address(0)

Burned tokens are sent to address(0) by convention.

https://ethereum.stackexchange.com/questions/42717/what-does-address0-mean


### See balance of contract

Look at blockchain info.

https://www.edureka.co/community/30536/how-do-i-get-the-balance-of-an-account-in-ethereum