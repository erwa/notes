### Precision vs. recall
Precision = number of selected items that are relevant (no false positives). All of the selected items should be relevant (if not, they were false positives).

Recall = number of relevant items that are selected (no false negatives). All of the relevant items should have been selected (if they weren't -- they are false negatives.)

https://en.wikipedia.org/wiki/Precision_and_recall


### Difference of powers expansion

(a^n - b^n) = (a^(k-1)*b^0 + a^(k-2)*b^1 + a^(k-3)*b^2 + ... + a^1*b^(k-2) + a^0*b^(k-1))


### Euler's number

e = limit as n -> infinity of (1 + 1/n)^n
e = sum as n goes from 0 to infinity of 1/n!

#### Application to compound interest
http://en.wikipedia.org/wiki/E_%28mathematical_constant%29#Compound_interest
Account starts with $1, 100% interest per year.
If paid once at end of year, ends with $2.
If paid twice, 50% every 6 months, ends with 1.5^2 = $2.25.
Quarterly: (1+1/4)^4 = $2.4414...
Monthly: (1+1/12)^12 = $2.6130...
Weekly:  (1+1/52)^52 = $2.6925...
Daily: (1+1/365)^365 = $2.7145...
Continuously: limit as n -> infinity of (1+1/n)^n = Euler's number = $2.7182...

1/e = limit as n -> infinity of (1-1/n)^n = limit as n -> infinity of (n/(n+1))^n

1 - x <= e^(-x)
# You can convince yourself by plotting the two functions.

sum as n goes from 0 to infinity of x^n = 1/(1-x) when |x| < 1