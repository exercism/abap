CLASS zcl_leap_example DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS leap
      IMPORTING
        year         TYPE i
      RETURNING
        VALUE(result) TYPE abap_bool.
ENDCLASS.

CLASS zcl_leap_example IMPLEMENTATION.

  METHOD leap.
    IF year MOD 4 = 0 AND year MOD 100 <> 0.
      result = abap_true.
    ELSEIF year MOD 400 = 0.
      result = abap_true.
    ELSE.
      result = abap_false.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
