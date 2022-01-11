CLASS zcl_grains DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS square
      IMPORTING
        input         TYPE i
      RETURNING
        VALUE(result) TYPE decfloat34
      RAISING
        cx_parameter_invalid.
    METHODS total
      RETURNING
        VALUE(result) TYPE decfloat34
      RAISING
        cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_grains IMPLEMENTATION.
  METHOD square.
    " add solution here
  ENDMETHOD.

  METHOD total.
    " add solution here
  ENDMETHOD.


ENDCLASS.