class ltcl_fizz_buzz DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT FINAL.

  private section.
    data cut type ref to zcl_Fizz_Buzz.

    METHODS setup.
    methods test_fizz_Buzz FOR TESTING RAISING cx_static_check.

endclass.


class ltcl_fizz_buzz implementation.

  METHOD setup.
    cut = NEW ZCL_FIZZ_BUZZ( ).
  ENDMETHOD.

  method test_fizz_Buzz.
  data result TYPE string_tab11.
    DO 100 TIMES.
      IF sy-index MOD 3 = 0.
        append 'Fizz' to result.
      ENDIF.

      IF sy-index MOD 5 = 0.
        append 'Buzz' to result.
      ENDIF.

      IF sy-index MOD 3 = 0 AND
         sy-index MOD 5 = 0.
        append 'FizzBuzz' to result.
      ENDIF.
    ENDDO.

    cl_abap_unit_assert=>assert_equals(
      act = cut->fizz_Buzz( )
      exp = result ).

  endmethod.

endclass.