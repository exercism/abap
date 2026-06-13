# Introduction

ABAP supports arithmetic operators for calculations with numeric values.

```abap
DATA day_rate TYPE p LENGTH 8 DECIMALS 2.
day_rate = rate_per_hour * 8.
```

The basic operators are:

- `+` for addition.
- `-` for subtraction.
- `*` for multiplication.
- `/` for division.
- `MOD` for the remainder of an integer division.

```abap
DATA full_months TYPE i.
full_months = floor( num_days / 22 ).

DATA remaining_days TYPE i.
remaining_days = num_days MOD 22.
```

ABAP evaluates multiplication and division before addition and subtraction. Parentheses can be used to make the intended order explicit.

```abap
DATA discounted_rate TYPE p LENGTH 8 DECIMALS 2.
discounted_rate = monthly_rate * ( 1 - discount ).
```

[arithmetic-expressions]: https://help.sap.com/doc/abapdocu_latest_index_htm/latest/en-US/index.htm?file=abenarith_operators.htm
