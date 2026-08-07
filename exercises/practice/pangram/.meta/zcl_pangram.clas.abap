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
    DATA(uppercase_sentence) = to_upper( sentence ).

    DO strlen( sy-abcde ) TIMES.
      DATA(letter) = substring( val = sy-abcde off = sy-index - 1 len = 1 ).
      IF NOT contains( val = uppercase_sentence sub = letter ).
        RETURN.
      ENDIF.
    ENDDO.

    result = abap_true.
  ENDMETHOD.


ENDCLASS.
