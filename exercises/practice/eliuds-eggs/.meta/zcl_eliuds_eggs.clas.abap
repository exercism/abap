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
    DATA(temp) = number.
    WHILE temp > 0.
      count = count + ( temp MOD 2 ).
      temp = temp DIV 2.
    ENDWHILE.
  ENDMETHOD.
ENDCLASS.
