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
    IF input < 1 OR input > 64.
      RAISE EXCEPTION NEW cx_parameter_invalid( ).
    ENDIF.
    result = 1.
    DO input - 1 TIMES.
      result = result * 2.
    ENDDO.
  ENDMETHOD.

  METHOD total.
    DO 64 TIMES.
      result = result + square( sy-index ).
    ENDDO.
  ENDMETHOD.


ENDCLASS.