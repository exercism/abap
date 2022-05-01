CLASS zcl_minesweeper DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.

    METHODS annotate
        IMPORTING
          !input        TYPE string_table
        RETURNING
          VALUE(result) TYPE string_table.

ENDCLASS.

CLASS zcl_minesweeper IMPLEMENTATION.

  METHOD annotate.
    " add solution here
  ENDMETHOD.

ENDCLASS.