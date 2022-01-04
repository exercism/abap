CLASS zcl_raindrops DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS raindrops
      IMPORTING
        input         TYPE i
      RETURNING
        VALUE(result) TYPE string.
ENDCLASS.

CLASS zcl_raindrops IMPLEMENTATION.

  METHOD raindrops.
    IF input MOD 3 = 0.
      result = |{ result }Pling|.
    ENDIF.
    IF input MOD 5 = 0.
      result = |{ result }Plang|.
    ENDIF.
    IF input MOD 7 = 0.
      result = |{ result }Plong|.
    ENDIF.

    IF input MOD 3 <> 0 AND
        input MOD 5 <> 0 AND
        input MOD 7 <> 0.
      result = input.
    ENDIF.
  ENDMETHOD.

ENDCLASS.