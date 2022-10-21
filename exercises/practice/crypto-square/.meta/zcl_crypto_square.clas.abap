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
      column TYPE i VALUE 2,
      row    TYPE i VALUE 1.
    DATA(str) = plain_text.
    str = replace( val   = str
                   regex = '[\.,\-]'
                   with  = ` `
                   occ   = 0 ).
    str = replace( val   = str
                   regex = '[[:punct:]]'
                   with  = ' '
                   occ   = 0 ).
    CONDENSE str NO-GAPS.
    DATA(str_len) = strlen( str ).
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
    DATA(col) = 0.
    DATA(row_id) = 0.

    WHILE col <> column.
      WHILE row_id <> row.
        crypto_text &&= |{ COND string( WHEN ( ( row_id * column ) + col ) >= str_len
                                          THEN COND string( WHEN row > 1 THEN ` `
                                                            ELSE `` )
                                          ELSE to_lower( substring( val = str
                                                                    off = ( ( row_id * column ) + col )
                                                                    len = 1 ) ) )
                        }{ COND string( WHEN row_id + 1 = row
                                          AND col + 1 < column
                                          AND row > 1  THEN ` `
                                        ELSE `` ) }|.
        row_id += 1.
      ENDWHILE.
      row_id = 0.
      col += 1.
    ENDWHILE.
  ENDMETHOD.
ENDCLASS.