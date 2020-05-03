### True / truthiness

A non-zero top stack element is considered true.

https://bitcoin.stackexchange.com/questions/37088/does-value-true-at-the-middle-of-stack-is-valid-transaction


### OP_IF

```
OP_IF <statements>
# can optionally have OP_ELSE <statements>
OP_END_IF
```

Checks top element of stack and removes it. If the element was true, the statements are executed; otherwise they are not.

https://en.bitcoin.it/wiki/Script#Flow_control


### OP_CHECKLOCKTIMEVERIFY

Allows you to create a transaction whose outputs are provably unspendable before a certain time in the future. OP_CHECKLOCKTIMEVERIFY compares a number against the lock time of a redeeming transaction, and if the redeeming transaction's lock time is not set or too early, the transaction is considered invalid.

https://github.com/bitcoin/bips/blob/master/bip-0065.mediawiki


### 2-of-3 MULTISIG

```
Pubkey script: OP_HASH160 <Hash160(redeemScript)> OP_EQUAL
Redeem script: <OP_2> <A pubkey> <B pubkey> <C pubkey> <OP_3> OP_CHECKMULTISIG
Signature script: OP_0 <A sig> <C sig> <redeemScript>
```

https://bitcoin.org/en/transactions-guide#multisig


### Valid Bitcoin script

Valid if topmost element at end of execution is non-zero.

https://bitcoin.stackexchange.com/questions/37088/does-value-true-at-the-middle-of-stack-is-valid-transaction