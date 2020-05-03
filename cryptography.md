### Digital signatures

hash(m,R)•X + R = s•P

To sign a message m, you provide R and s that satisfy the above equation. You could only feasibly provide such values if you knew the private key x that satisfies X = x•P, where X is the public key. The digital signature is R and s.

R is a point on the elliptic curve; you only need to provide one of the coordinates, generally the x-coordinate.

https://hackernoon.com/what-is-the-math-behind-elliptic-curve-cryptography-f61b25253da3