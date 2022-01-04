CLASS ltcl_raindropds DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT FINAL.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_raindrops.
    METHODS setup.
        methods: test_number1 FOR TESTING RAISING cx_static_check.
        methods: test_number2 FOR TESTING RAISING cx_static_check.
        methods: test_pling FOR TESTING RAISING cx_static_check.
        methods: test_plang FOR TESTING RAISING cx_static_check.
        methods: test_plong FOR TESTING RAISING cx_static_check.
        methods: test_plingplang FOR TESTING RAISING cx_static_check.

ENDCLASS.

CLASS ltcl_raindropds IMPLEMENTATION.

  METHOD setup.
    cut = NEW ZCL_FIZZ_BUZZ_SOLUTION( ).
  ENDMETHOD.

  method test_number1.
    cl_abap_unit_assert=>assert_equals(
      act = cut->fizz_Buzz( 1 )
      exp = 1 ).
  endmethod.
    method test_number2.
    cl_abap_unit_assert=>assert_equals(
      act = cut->fizz_Buzz( 307 )
      exp = 307 ).
  endmethod.
  method test_pling.
    cl_abap_unit_assert=>assert_equals(
      act = cut->fizz_Buzz( 303 )
      exp = 'Pling' ).
  endmethod.
    method test_plang.
    cl_abap_unit_assert=>assert_equals(
      act = cut->fizz_Buzz( 230 )
      exp = 'Plang' ).
  endmethod.
    method test_plong.
    cl_abap_unit_assert=>assert_equals(
      act = cut->fizz_Buzz( 679 )
      exp = 'Plong' ).
  endmethod.
      method test_plingplang.
    cl_abap_unit_assert=>assert_equals(
      act = cut->fizz_Buzz( 30 )
      exp = 'PlingPlang' ).
  endmethod.

ENDCLASS.