CLASS zcl_hamming DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS distance
      IMPORTING
        first_strand          TYPE string
        second_strand         TYPE string
      RETURNING
        VALUE(result) TYPE i
      RAISING
        cx_static_check.
ENDCLASS.

CLASS zcl_hamming IMPLEMENTATION.

  METHOD distance.
    " add solution here
  ENDMETHOD.

ENDCLASS.