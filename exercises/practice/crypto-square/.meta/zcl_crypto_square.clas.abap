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
    DO str_len TIMES.
      IF ( column * row ) >= str_len.
        EXIT.
      ENDIF.
      IF column > row.
        row  += 1.
      ELSE.
        column += 1.
      ENDIF.
    ENDDO.
    DATA(col) = 0.
    DATA(row_id) = 0.
    DATA(offset) = 0.
    DATA(nxt_row) = 0.
    DATA(nxt_col) = 0.
    DO column TIMES.

      DO row TIMES.
        offset = ( row_id * column ) + col.
        nxt_row = row_id + 1.
        nxt_col = col + 1.
        crypto_text &&= |{ COND string( WHEN offset >= str_len
                                          THEN COND string( WHEN row > 1 THEN ` `
                                                            ELSE `` )
                                        ELSE to_lower( substring( val = str
                                                                  off = offset
                                                                  len = 1 ) ) )
                         }{ COND string( WHEN nxt_row = row
                                           AND nxt_col < column
                                           AND row > 1  THEN ` `
                                         ELSE `` ) }|.
        row_id += 1.
      ENDDO.
      row_id = 0.
      col += 1.
    ENDDO.
  ENDMETHOD.
ENDCLASS.
