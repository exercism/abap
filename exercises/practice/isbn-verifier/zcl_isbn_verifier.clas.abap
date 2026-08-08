CLASS zcl_isbn_verifier DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS is_valid
      IMPORTING
        VALUE(isbn)   TYPE string
      RETURNING
        VALUE(result) TYPE abap_bool.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_isbn_verifier IMPLEMENTATION.
  METHOD is_valid.
    " add solution here
  ENDMETHOD.


ENDCLASS.
