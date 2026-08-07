CLASS zcl_pangram DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS is_pangram
      IMPORTING
        VALUE(sentence) TYPE string
      RETURNING
        VALUE(result) TYPE abap_bool.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_pangram IMPLEMENTATION.
  METHOD is_pangram.
    " add solution here
  ENDMETHOD.


ENDCLASS.
