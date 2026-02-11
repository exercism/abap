CLASS zcl_protein_translation DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS proteins
      IMPORTING
        strand        TYPE string
      RETURNING
        VALUE(result) TYPE string_table
      RAISING
        cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS zcl_protein_translation IMPLEMENTATION.
  METHOD proteins.
    "Implement solution
  ENDMETHOD.
ENDCLASS.
