# Introduction

## Numbers

ABAP has several numeric types. In this exercise, you will use two of them:

- `i` for integer values, such as a number of days.
- `p` for packed decimal values, such as an hourly rate or discount.

```abap
DATA billable_days TYPE i VALUE 22.
DATA rate_per_hour TYPE p LENGTH 8 DECIMALS 2 VALUE '89.89'.
```

Packed numbers define their maximum length and number of decimal places.
Decimal literals are commonly written as text values and converted to the target decimal type by the compiler or with `CONV`.

```abap
TYPES discount_rate TYPE p LENGTH 8 DECIMALS 6.

DATA discount TYPE discount_rate.
discount = CONV discount_rate( '0.15' ).
```

### Rounding

ABAP provides built-in numeric functions for rounding.
The `floor` function rounds down to the nearest whole number, and `ceil` rounds up to the nearest whole number.

```abap
DATA full_months TYPE i.
full_months = floor( 70 / 22 ).

DATA rounded_cost TYPE i.
rounded_cost = ceil( '14527.2' ).
```

## Arithmetic Operators

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
DATA remaining_days TYPE i.
remaining_days = num_days MOD 22.
```

ABAP evaluates multiplication and division before addition and subtraction.
Parentheses can be used to make the intended order explicit.

```abap
DATA discounted_rate TYPE p LENGTH 8 DECIMALS 2.
discounted_rate = monthly_rate * ( 1 - discount ).
```

[numeric-types]: https://help.sap.com/doc/abapdocu_latest_index_htm/latest/en-US/index.htm?file=abenbuiltin_types_numeric.htm
[arithmetic-expressions]: https://help.sap.com/doc/abapdocu_latest_index_htm/latest/en-US/index.htm?file=abenarith_operators.htm
