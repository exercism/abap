CLASS zcl_atbash_cipher DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS decode
      IMPORTING
        cipher_text TYPE string
      RETURNING
        VALUE(plain_text)  TYPE string .
    METHODS encode
      IMPORTING
        plain_text        TYPE string
      RETURNING
        VALUE(cipher_text) TYPE string .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_atbash_cipher IMPLEMENTATION.

  METHOD decode.

    plain_text = encode( cipher_text ).
    REPLACE ALL OCCURRENCES OF ` ` IN plain_text WITH ''.

  ENDMETHOD.

  METHOD encode.
    DATA output TYPE string.
    DATA(input) = to_lower( plain_text ).
    REPLACE ALL OCCURRENCES OF ` ` IN input WITH ''.
    REPLACE ALL OCCURRENCES OF '.' IN input WITH ''.
    REPLACE ALL OCCURRENCES OF ',' IN input WITH ''.
    WHILE strlen( input ) > 0.
      DATA(index) = find( val = to_lower( sy-abcde ) sub = input(1) ).
      IF index < 0.
        cipher_text = cipher_text && input(1).
      ELSE.
        cipher_text = cipher_text && substring( val = reverse( to_lower( sy-abcde ) ) off = index len = 1 ).
      ENDIF.
      input = input+1.
    ENDWHILE.

    WHILE strlen( cipher_text ) > 5.
      output = output && cipher_text(5) && ` `.
      cipher_text = cipher_text+5.
    ENDWHILE.
    cipher_text = output && cipher_text.
  ENDMETHOD.
ENDCLASS.