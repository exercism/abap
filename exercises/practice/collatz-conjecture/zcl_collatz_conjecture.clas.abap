CLASS zcl_collatz_conjecture DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS ret_steps IMPORTING num          TYPE i
                      RETURNING VALUE(steps) TYPE i
                      RAISING   cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_collatz_conjecture IMPLEMENTATION.
  METHOD ret_steps.
    "Implement Solution
  ENDMETHOD.
ENDCLASS.
