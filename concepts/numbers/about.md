# About

ABAP has several numeric types. The most common ones for small introductory exercises are `i` for integer values and `p` for packed decimal values.

Use `i` when a value must be a whole number, such as a count of days. Use a decimal type when a value can contain fractional digits, such as an hourly rate.

```abap
DATA hours_per_day TYPE i VALUE 8.
DATA rate_per_hour TYPE p LENGTH 8 DECIMALS 2 VALUE '89.89'.

DATA day_rate TYPE p LENGTH 8 DECIMALS 2.
day_rate = hours_per_day * rate_per_hour.
```

Packed numbers are often used in business applications when a fixed number of decimal places is required. ABAP also has decimal floating point numbers (`decfloat16` and `decfloat34`) and binary floating point numbers (`f`). Binary floating point numbers can be useful for scientific calculations, but they are not a good default for money-like examples because many decimal fractions cannot be represented exactly.

[numeric-types]: https://help.sap.com/doc/abapdocu_latest_index_htm/latest/en-US/index.htm?file=abenbuiltin_types_numeric.htm
