# About

ABAP supports the usual arithmetic operators for numeric values:

- `+` adds values.
- `-` subtracts values.
- `*` multiplies values.
- `/` divides values.
- `MOD` returns the remainder of an integer division.

```abap
DATA total TYPE i.
total = 6 + 4 * 2.

DATA remaining_days TYPE i.
remaining_days = 70 MOD 22.
```

Multiplication and division are evaluated before addition and subtraction. Use parentheses when a calculation should be grouped explicitly.

```abap
DATA result TYPE i.
result = ( 6 + 4 ) * 2.
```

[arithmetic-expressions]: https://help.sap.com/doc/abapdocu_latest_index_htm/latest/en-US/index.htm?file=abenarith_operators.htm
