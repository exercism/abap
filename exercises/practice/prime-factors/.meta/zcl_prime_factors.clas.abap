CLASS zcl_prime_factors DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES integertab TYPE STANDARD TABLE OF i WITH EMPTY KEY.
    METHODS factors
      IMPORTING
        input         TYPE int8
      RETURNING
        VALUE(result) TYPE integertab.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_prime_factors IMPLEMENTATION.
  METHOD factors.
    DATA(temp_input) = input.
    DATA(divisor) = 2.
    WHILE temp_input > 1.
      WHILE temp_input MOD divisor <> 0.
        divisor = divisor + 1.
      ENDWHILE.
      APPEND divisor TO result.
      temp_input = temp_input / divisor.
    ENDWHILE.
  ENDMETHOD.


ENDCLASS.