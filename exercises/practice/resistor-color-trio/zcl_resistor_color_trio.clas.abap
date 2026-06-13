CLASS zcl_resistor_color_trio DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS label
      IMPORTING
        colors       TYPE string_table
      RETURNING
        VALUE(result) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS zcl_resistor_color_trio IMPLEMENTATION.
  METHOD label.
    "Implement solution
  ENDMETHOD.
ENDCLASS.
