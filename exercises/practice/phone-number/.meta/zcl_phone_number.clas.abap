CLASS zcl_phone_number DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS clean
      IMPORTING
        !number       TYPE string
      RETURNING
        VALUE(result) TYPE string
      RAISING
        cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_phone_number IMPLEMENTATION.

  METHOD clean.
    DATA(lv_number) = number.
    CONDENSE lv_number NO-GAPS.
    REPLACE ALL OCCURRENCES OF '+' IN lv_number WITH ''.
    REPLACE ALL OCCURRENCES OF '-' IN lv_number WITH ''.
    REPLACE ALL OCCURRENCES OF '(' IN lv_number WITH ''.
    REPLACE ALL OCCURRENCES OF ')' IN lv_number WITH ''.
    REPLACE ALL OCCURRENCES OF '.' IN lv_number WITH ''.
    REPLACE ALL OCCURRENCES OF '+' IN lv_number WITH ''.

    "invalid when less or than 10 or more than 11 numbers
    IF strlen( lv_number ) < 10 OR strlen( lv_number ) > 11.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.
    " invalid if contains something else than digits
    IF lv_number CO '0123456789'.
      lv_number = lv_number.
    ELSE.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    IF strlen( lv_number ) = 11.
      " invalid when 11 digits and does not start with '1'
      IF lv_number+0(1) <> '1'.
        RAISE EXCEPTION TYPE cx_parameter_invalid.
      ENDIF.
      lv_number = lv_number+1(10).
    ENDIF.
    "invalid if area code 0 or 1
    IF lv_number+0(1) = '0' OR lv_number+0(1) = '1'.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.
    "invalid if exchange code 0 or 1
    IF lv_number+3(1) = '0' OR lv_number+3(1) = '1'.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.
    result = lv_number.

  ENDMETHOD.
ENDCLASS.