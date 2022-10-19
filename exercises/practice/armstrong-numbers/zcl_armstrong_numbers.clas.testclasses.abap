CLASS ltcl_armstrong_numbers DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_armstrong_numbers.
    METHODS setup.
    METHODS tst_0 FOR TESTING.
    METHODS tst_5 FOR TESTING.
    METHODS tst_10 FOR TESTING.
    METHODS tst_100 FOR TESTING.
    METHODS tst_9474 FOR TESTING.
    METHODS tst_9475 FOR TESTING.
    METHODS tst_9926315 FOR TESTING.
    METHODS tst_9926314 FOR TESTING.
    METHODS tst_bignum FOR TESTING.
    METHODS tst_153 FOR TESTING.
ENDCLASS.


CLASS ltcl_armstrong_numbers IMPLEMENTATION.
  METHOD setup.
    cut = NEW zcl_armstrong_numbers( ).
  ENDMETHOD.

  METHOD tst_153.
    cl_abap_unit_assert=>assert_equals( exp = abap_true
                                        act = cut->is_armstrong_number( 153 ) ).
  ENDMETHOD.

  METHOD tst_0.
    cl_abap_unit_assert=>assert_equals( exp = abap_true
                                        act = cut->is_armstrong_number( 0 ) ).
  ENDMETHOD.

  METHOD tst_10.
    cl_abap_unit_assert=>assert_equals( exp = abap_false
                                        act = cut->is_armstrong_number( 10 ) ).
  ENDMETHOD.

  METHOD tst_100.
    cl_abap_unit_assert=>assert_equals( exp = abap_false
                                        act = cut->is_armstrong_number( 100 ) ).
  ENDMETHOD.

  METHOD tst_bignum.
    cl_abap_unit_assert=>assert_equals( exp = abap_true
                                        act = cut->is_armstrong_number( 146511208 ) ).
  ENDMETHOD.

  METHOD tst_5.
    cl_abap_unit_assert=>assert_equals( exp = abap_true
                                        act = cut->is_armstrong_number( 5 ) ).
  ENDMETHOD.

  METHOD tst_9474.
    cl_abap_unit_assert=>assert_equals( exp = abap_true
                                        act = cut->is_armstrong_number( 9474 ) ).
  ENDMETHOD.

  METHOD tst_9475.
    cl_abap_unit_assert=>assert_equals( exp = abap_false
                                        act = cut->is_armstrong_number( 9475 ) ).
  ENDMETHOD.

  METHOD tst_9926314.
    cl_abap_unit_assert=>assert_equals( exp = abap_false
                                        act = cut->is_armstrong_number( 9926314 ) ).
  ENDMETHOD.

  METHOD tst_9926315.
    cl_abap_unit_assert=>assert_equals( exp = abap_true
                                        act = cut->is_armstrong_number( 9926315 ) ).
  ENDMETHOD.

ENDCLASS.
