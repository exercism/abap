CLASS zcl_crypto_square DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS encode IMPORTING plain_text         TYPE string
                   RETURNING VALUE(crypto_text) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_crypto_square IMPLEMENTATION.
  METHOD encode.
    "Implement Solution
  ENDMETHOD.
ENDCLASS.
