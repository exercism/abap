CLASS ltcl_matrix DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT FINAL.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_matrix.
    METHODS setup.
    METHODS test_extract_row_one FOR TESTING RAISING cx_static_check.
    METHODS test_extract_row_two FOR TESTING RAISING cx_static_check.
    METHODS test_extract_row_three FOR TESTING RAISING cx_static_check.
    METHODS test_extract_row_four FOR TESTING RAISING cx_static_check.
    METHODS test_extract_column_one FOR TESTING RAISING cx_static_check.
    METHODS test_extract_column_two FOR TESTING RAISING cx_static_check.
    METHODS test_extract_column_three FOR TESTING RAISING cx_static_check.
    METHODS test_extract_column_four FOR TESTING RAISING cx_static_check.


ENDCLASS.

CLASS ltcl_matrix IMPLEMENTATION.

  METHOD setup.
    cut = NEW zcl_matrix( ).
  ENDMETHOD.

  " extract row from one number matrix
  METHOD test_extract_row_one.
    DATA(exptected_value) = VALUE zcl_matrix=>integertab( ( 1 ) ).
    DATA(actual_value) = cut->matrix_row( string = '1'
                                          index = 1 ).
    cl_abap_unit_assert=>assert_equals(
      act = actual_value
      exp = exptected_value ).
  ENDMETHOD.

  " can extract row
  METHOD test_extract_row_two.
    DATA(exptected_value) = VALUE zcl_matrix=>integertab( ( 3 ) ( 4 ) ).
    DATA(actual_value) = cut->matrix_row( string = '1 2\n3 4'
                                          index  = 2 ).
    cl_abap_unit_assert=>assert_equals(
      act = actual_value
      exp = exptected_value ).
  ENDMETHOD.

  " extract row from one number matrix
  METHOD test_extract_row_three.
    DATA(exptected_value) = VALUE zcl_matrix=>integertab( ( 10 ) ( 20 ) ).
    DATA(actual_value) = cut->matrix_row( string = '1 2\n10 20'
                                          index  = 2 ).
    cl_abap_unit_assert=>assert_equals(
      act = actual_value
      exp = exptected_value ).
  ENDMETHOD.

  " can extract row from non-square matrix with no corresponding column
  METHOD test_extract_row_four.
    DATA(exptected_value) = VALUE zcl_matrix=>integertab( ( 8 ) ( 7 ) ( 6 ) ).
    DATA(actual_value) = cut->matrix_row( string = '1 2 3\n4 5 6\n7 8 9\n8 7 6'
                                          index  = 4 ).
    cl_abap_unit_assert=>assert_equals(
      act = actual_value
      exp = exptected_value ).
  ENDMETHOD.

  " extract column from one number matrix
  METHOD test_extract_column_one.
    DATA(exptected_value) = VALUE zcl_matrix=>integertab( ( 1 ) ).
    DATA(actual_value) = cut->matrix_column( string = '1'
                                             index  = 1 ).
    cl_abap_unit_assert=>assert_equals(
      act = actual_value
      exp = exptected_value ).
  ENDMETHOD.

  " can extract column
  METHOD test_extract_column_two.
    DATA(exptected_value) = VALUE zcl_matrix=>integertab( ( 3 ) ( 6 ) ( 9 ) ).
    DATA(actual_value) = cut->matrix_column( string = '1 2 3\n4 5 6\n7 8 9'
                                             index  = 3 ).
    cl_abap_unit_assert=>assert_equals(
      act = actual_value
      exp = exptected_value ).
  ENDMETHOD.

  " can extract column from non-square matrix with no corresponding row
  METHOD test_extract_column_three.
    DATA(exptected_value) = VALUE zcl_matrix=>integertab( ( 4 ) ( 8 ) ( 6 ) ).
    DATA(actual_value) = cut->matrix_column( string = '1 2 3 4\n5 6 7 8\n9 8 7 6'
                                             index  = 4 ).
    cl_abap_unit_assert=>assert_equals(
      act = actual_value
      exp = exptected_value ).
  ENDMETHOD.

  " extract column where numbers have different widths
  METHOD test_extract_column_four.
    DATA(exptected_value) = VALUE zcl_matrix=>integertab( ( 1903 ) ( 3 ) ( 4 ) ).
    DATA(actual_value) = cut->matrix_column( string = '89 1903 3\n18 3 1\n9 4 800'
                                             index  = 2 ).
    cl_abap_unit_assert=>assert_equals(
      act = actual_value
      exp = exptected_value ).
  ENDMETHOD.


ENDCLASS.