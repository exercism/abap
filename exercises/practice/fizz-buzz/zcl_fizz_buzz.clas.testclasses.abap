CLASS ltcl_fizz_buzz DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT FINAL.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_fizz_buzz.

    METHODS setup.
    METHODS test_fizz_buzz FOR TESTING RAISING cx_static_check.

ENDCLASS.


CLASS ltcl_fizz_buzz IMPLEMENTATION.

  METHOD setup.
    cut = NEW zcl_fizz_buzz( ).
  ENDMETHOD.

  METHOD test_fizz_buzz.
    DATA result TYPE string_tab11.
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

    cl_abap_unit_assert=>assert_equals(
      act = cut->fizz_buzz( )
      exp = result ).

  ENDMETHOD.

ENDCLASS.