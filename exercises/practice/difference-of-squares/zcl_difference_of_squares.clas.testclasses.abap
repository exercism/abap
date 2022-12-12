*"* use this source file for your ABAP unit test classes
CLASS ltcl_difference_of_squares DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_difference_of_squares.
    METHODS setup.
    METHODS:
      square_of_sum_1     FOR TESTING,
      square_of_sum_5     FOR TESTING,
      square_of_sum_100   FOR TESTING,
      sum_of_squares_1    FOR TESTING,
      sum_of_squares_5    FOR TESTING,
      sum_of_squares_100  FOR TESTING,
      diff_of_squares_1   FOR TESTING,
      diff_of_squares_5   FOR TESTING,
      diff_of_squares_100 FOR TESTING.
ENDCLASS.


CLASS ltcl_difference_of_squares IMPLEMENTATION.
  METHOD setup.
    cut = NEW zcl_difference_of_squares( ).
  ENDMETHOD.

  METHOD square_of_sum_1.
    cl_abap_unit_assert=>assert_equals(
      exp = 1
      act = cut->ret_square_of_sum( 1 ) ).
  ENDMETHOD.

  METHOD square_of_sum_5.
    cl_abap_unit_assert=>assert_equals(
      exp = 225
      act = cut->ret_square_of_sum( 5 ) ).
  ENDMETHOD.

  METHOD square_of_sum_100.
    cl_abap_unit_assert=>assert_equals(
      exp = 25502500
      act = cut->ret_square_of_sum( 100 ) ).
  ENDMETHOD.

  METHOD sum_of_squares_1.
    cl_abap_unit_assert=>assert_equals(
      exp = 1
      act = cut->ret_square_of_sum( 1 ) ).
  ENDMETHOD.

  METHOD sum_of_squares_5.
    cl_abap_unit_assert=>assert_equals(
      exp = 55
      act = cut->ret_sum_of_squares( 5 ) ).
  ENDMETHOD.

  METHOD sum_of_squares_100.
    cl_abap_unit_assert=>assert_equals(
      exp = 338350
      act = cut->ret_sum_of_squares( 100 ) ).
  ENDMETHOD.

  METHOD diff_of_squares_1.
    cl_abap_unit_assert=>assert_equals(
      exp = 0
      act = cut->ret_difference_of_squares( 1 ) ).
  ENDMETHOD.

  METHOD diff_of_squares_5.
    cl_abap_unit_assert=>assert_equals(
      exp = 170
      act = cut->ret_difference_of_squares( 5 ) ).
  ENDMETHOD.

  METHOD diff_of_squares_100.
    cl_abap_unit_assert=>assert_equals(
      exp = 25164150
      act = cut->ret_difference_of_squares( 100 ) ).
  ENDMETHOD.
ENDCLASS.
