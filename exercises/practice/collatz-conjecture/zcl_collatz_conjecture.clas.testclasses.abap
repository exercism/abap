CLASS ltcl_collatz_conjecture DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_collatz_conjecture.
    METHODS: setup,
      test_1        FOR TESTING,
      test_16       FOR TESTING,
      test_12       FOR TESTING,
      test_largenum FOR TESTING,
      test_0        FOR TESTING,
      test_minus_20 FOR TESTING.
ENDCLASS.


CLASS ltcl_collatz_conjecture IMPLEMENTATION.
  METHOD setup.
    cut = NEW zcl_collatz_conjecture( ).
  ENDMETHOD.

  METHOD test_1.
    cl_abap_unit_assert=>assert_equals( exp = 0
                                        act = cut->ret_steps( 1 ) ).
  ENDMETHOD.

  METHOD test_16.
    cl_abap_unit_assert=>assert_equals( exp = 4
                                        act = cut->ret_steps( 16 ) ).
  ENDMETHOD.

  METHOD test_12.
    cl_abap_unit_assert=>assert_equals( exp = 9
                                        act = cut->ret_steps( 12 ) ).
  ENDMETHOD.

  METHOD test_largenum.
    cl_abap_unit_assert=>assert_equals( exp = 152
                                        act = cut->ret_steps( 1000000 ) ).
  ENDMETHOD.

  METHOD test_0.
    TRY.
        cut->ret_steps( 0 ).
        cl_abap_unit_assert=>fail( ).
      CATCH cx_parameter_invalid.
    ENDTRY.
  ENDMETHOD.

  METHOD test_minus_20.
    TRY.
        cut->ret_steps( -20 ).
        cl_abap_unit_assert=>fail( ).
      CATCH cx_parameter_invalid.
    ENDTRY.
  ENDMETHOD.

ENDCLASS.
