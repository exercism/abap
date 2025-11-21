CLASS zcl_flower_field DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.

    METHODS annotate
      IMPORTING
        !input        TYPE string_table
      RETURNING
        VALUE(result) TYPE string_table.

ENDCLASS.



CLASS zcl_flower_field IMPLEMENTATION.
  METHOD annotate.

    DATA n TYPE n LENGTH 1.
    DATA res TYPE string.

    CONCATENATE LINES OF input INTO DATA(field) RESPECTING BLANKS.
    DATA(count) = strlen( field ).
    DATA(rows) = lines( input ).
    DATA(cols) = count DIV rows.

    DO rows TIMES.
      DATA(row) = sy-index - 1.
      DO cols TIMES.
        DATA(col) = sy-index - 1.
        n = 0.
        DO 9 TIMES.
          CASE sy-index.
            WHEN 1.
              DATA(r) = row.
              DATA(c) = col.
            WHEN 2.
              r = row.
              c = col + 1.
            WHEN 3.
              r = row.
              c = col - 1.
            WHEN 4.
              r = row + 1.
              c = col.
            WHEN 5.
              r = row + 1.
              c = col + 1.
            WHEN 6.
              r = row + 1.
              c = col - 1.
            WHEN 7.
              r = row - 1.
              c = col.
            WHEN 8.
              r = row - 1.
              c = col + 1.
            WHEN 9.
              r = row - 1.
              c = col - 1.
          ENDCASE.
          IF r BETWEEN 0 AND rows - 1 AND c BETWEEN 0 AND cols - 1.
            IF substring( val = field off = r * cols + c len = 1 ) = `*`.
              IF r = row AND c = col.
                n = 9.
                EXIT.
              ELSE.
                n = n + 1.
              ENDIF.
            ENDIF.
          ENDIF.
        ENDDO.
        IF n = 0.
          res = res && ` `.
        ELSEIF n = 9.
          res = res && `*`.
        ELSE.
          res = res && n.
        ENDIF.
      ENDDO.
    ENDDO.

    DO rows TIMES.
      INSERT substring( val = res off = ( sy-index - 1 ) * cols len = cols ) INTO TABLE result.
    ENDDO.

  ENDMETHOD.
ENDCLASS.
