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
    " add solution here
  ENDMETHOD.

ENDCLASS.
