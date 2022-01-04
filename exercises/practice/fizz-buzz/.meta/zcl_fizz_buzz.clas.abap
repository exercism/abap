CLASS zcl_fizz_buzz DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS fizz_buzz
      RETURNING
        VALUE(result) TYPE string_tab11.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fizz_buzz IMPLEMENTATION.


  METHOD fizz_buzz.

    DO 100 TIMES.

      IF sy-index MOD 3 = 0.
        APPEND 'Fizz' TO result.
      ENDIF.

      IF sy-index MOD 5 = 0.
        APPEND 'Buzz' TO result.
      ENDIF.

      IF sy-index MOD 3 = 0 AND
         sy-index MOD 5 = 0.
        APPEND 'FizzBuzz' TO result.
      ENDIF.
    ENDDO.
  ENDMETHOD.
ENDCLASS.