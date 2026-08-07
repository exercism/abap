CLASS zcl_space_age DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES age_in_years TYPE p LENGTH 3 DECIMALS 2.
    METHODS age
      IMPORTING
        planet        TYPE string
        seconds       TYPE i
      RETURNING
        VALUE(result) TYPE age_in_years
      RAISING
        cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_space_age IMPLEMENTATION.
  METHOD age.
    " add solution here
  ENDMETHOD.


ENDCLASS.
