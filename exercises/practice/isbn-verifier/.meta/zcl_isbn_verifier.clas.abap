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
    DATA(digits) = replace( val = isbn sub = '-' with = '' occ = 0 ).

    IF strlen( digits ) <> 10 OR NOT contains( val = digits regex = '^[0-9]{9}[0-9X]$' ).
      RETURN.
    ENDIF.

    DATA(total) = 0.

    DO 10 TIMES.
      DATA(character) = substring( val = digits off = sy-index - 1 len = 1 ).
      DATA(digit) = COND i( WHEN character = 'X' THEN 10 ELSE character ).
      total += digit * ( 11 - sy-index ).
    ENDDO.

    result = xsdbool( total MOD 11 = 0 ).
  ENDMETHOD.


ENDCLASS.
