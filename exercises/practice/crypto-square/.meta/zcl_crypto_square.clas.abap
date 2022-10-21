CLASS zcl_crypto_square DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS encode IMPORTING plain_text         TYPE string
                   RETURNING VALUE(crypto_text) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_crypto_square IMPLEMENTATION.
  METHOD encode.
    DATA:
      column  TYPE i VALUE 2,
      row     TYPE i VALUE 1,
      str     TYPE string,
      str_len TYPE i.
    str = plain_text.
    str = replace( val   = str
                  regex = '[\.,\-]'
                  with  = ` `
                  occ   = 0 ).
    str = replace( val   = str
                  regex = '[[:punct:]]'
                  with  = ' '
                  occ   = 0 ).
    CONDENSE str NO-GAPS.
    str_len = strlen( str ).
    IF str_len = 0.
      RETURN.
    ENDIF.
    WHILE ( column * row ) < str_len.
      IF column > row.
        row  += 1.
      ELSE.
        column += 1.
      ENDIF.
    ENDWHILE.

    crypto_text = REDUCE string(
                    INIT txt TYPE string
                    FOR i = 0 UNTIL i = column
                    FOR j = 0 UNTIL j = row
                      NEXT txt &&= |{
                        COND string( WHEN ( ( j * column ) + i ) >= str_len
                                    THEN COND string( WHEN row > 1 THEN ` `
                                                                    ELSE `` )
                                    ELSE to_lower( substring( val = str
                                                              off = ( ( j * column ) + i )
                                                              len = 1 ) ) )
                    }{ COND string( WHEN j + 1 = row
                                      AND i + 1 < column
                                      AND row > 1  THEN ` `
                                    ELSE `` ) }| ).
  ENDMETHOD.
ENDCLASS.