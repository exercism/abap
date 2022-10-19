CLASS zcl_armstrong_numbers DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS is_armstrong_number IMPORTING num           TYPE i
                                RETURNING VALUE(result) TYPE abap_bool.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_armstrong_numbers IMPLEMENTATION.
  METHOD is_armstrong_number.
    DATA:
      numstr  TYPE string,
      digits  TYPE i,
      chk_num TYPE i,
      counter TYPE i.

    numstr = condense( CONV string( num ) ).
    digits = strlen( numstr ).
    DO digits TIMES.
      chk_num += ipow( base = CONV i( substring( val = numstr off = counter len = 1 ) ) exp = digits ).
      counter += 1.
    ENDDO.

    IF chk_num = num.
      result = abap_true.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
