CLASS zcl_reverse_string_example DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS reverse_string
      IMPORTING
        input         TYPE string
      RETURNING
        VALUE(result) TYPE string.
ENDCLASS.

CLASS zcl_reverse_string_example IMPLEMENTATION.

  METHOD reverse_string.
    result = reverse( input ).
  ENDMETHOD.

ENDCLASS.