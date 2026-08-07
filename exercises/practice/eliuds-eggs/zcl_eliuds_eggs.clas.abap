CLASS zcl_eliuds_eggs DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS egg_count IMPORTING number       TYPE i
                      RETURNING VALUE(count) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_eliuds_eggs IMPLEMENTATION.
  METHOD egg_count.
    "Implement solution
  ENDMETHOD.
ENDCLASS.
