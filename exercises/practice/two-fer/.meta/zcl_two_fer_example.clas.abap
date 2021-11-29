CLASS zcl_two_fer_example DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS two_fer
      IMPORTING
        input         TYPE string OPTIONAL
      RETURNING
        VALUE(result) TYPE string.
ENDCLASS.

CLASS zcl_two_fer_example IMPLEMENTATION.

  METHOD two_fer.
    DATA(name) = input.
    IF name IS INITIAL.
      name = 'you'.
    ENDIF.
    result = |One for { name }, one for me.|.
  ENDMETHOD.

ENDCLASS.