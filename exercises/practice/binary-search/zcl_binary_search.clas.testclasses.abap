*"* use this source file for your ABAP unit test classes
CLASS ltcl_binary_search DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_binary_search.
    METHODS setup.
    METHODS:
      finds_valid_value FOR TESTING,
      finds_value_in_middle_of_table FOR TESTING,
      finds_value_at_start_of_table FOR TESTING,
      finds_value_at_end_of_table FOR TESTING,
      finds_value_in_odd_table FOR TESTING,
      finds_value_in_even_table FOR TESTING,
      identifies_value_not_in_table FOR TESTING,
      smaller_than_min_not_found FOR TESTING,
      larger_than_max_not_found FOR TESTING,
      nothing_found_in_empty_table FOR TESTING,
      not_found_when_bounds_cross FOR TESTING.

ENDCLASS.

CLASS ltcl_binary_search IMPLEMENTATION.

  METHOD setup.
    cut = NEW zcl_binary_search( ).
  ENDMETHOD.

  METHOD finds_valid_value.
    DATA(table) = VALUE zcl_binary_search=>integertab( ( 6 ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->binary_search( val = 6 table = table )
      exp = 1 ).
  ENDMETHOD.

  METHOD finds_value_in_middle_of_table.
    DATA(table) = VALUE zcl_binary_search=>integertab( ( 1 ) ( 3 ) ( 4 ) ( 6 ) ( 8 ) ( 9 ) ( 11 ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->binary_search( val = 6 table = table )
      exp = 4 ).
  ENDMETHOD.

  METHOD finds_value_at_start_of_table.
    DATA(table) = VALUE zcl_binary_search=>integertab( ( 1 ) ( 3 ) ( 4 ) ( 6 ) ( 8 ) ( 9 ) ( 11 ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->binary_search( val = 1 table = table )
      exp = 1 ).
  ENDMETHOD.

  METHOD finds_value_at_end_of_table.
    DATA(table) = VALUE zcl_binary_search=>integertab( ( 1 ) ( 3 ) ( 4 ) ( 6 ) ( 8 ) ( 9 ) ( 11 ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->binary_search( val = 11 table = table )
      exp = 7 ).
  ENDMETHOD.

  METHOD finds_value_in_odd_table.
    DATA(table) = VALUE zcl_binary_search=>integertab(
      ( 1 ) ( 3 ) ( 5 ) ( 8 ) ( 13 ) ( 21 ) ( 34 ) ( 55 ) ( 89 ) ( 144 ) ( 233 ) ( 377 ) ( 634 ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->binary_search( val = 144 table = table )
      exp = 10 ).
  ENDMETHOD.

  METHOD finds_value_in_even_table.
    DATA(table) = VALUE zcl_binary_search=>integertab(
      ( 1 ) ( 3 ) ( 5 ) ( 8 ) ( 13 ) ( 21 ) ( 34 ) ( 55 ) ( 89 ) ( 144 ) ( 233 ) ( 377 ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->binary_search( val = 21 table = table )
      exp = 6 ).
  ENDMETHOD.

  METHOD identifies_value_not_in_table.
    DATA(table) = VALUE zcl_binary_search=>integertab( ( 1 ) ( 3 ) ( 4 ) ( 6 ) ( 8 ) ( 9 ) ( 11 ) ).
    TRY.
        cut->binary_search(
          val = 7
          table = table ).
        cl_abap_unit_assert=>fail( 'Should have raised zcx_item_not_found' ).
      CATCH zcx_item_not_found.
    ENDTRY.
  ENDMETHOD.

  METHOD smaller_than_min_not_found.
    DATA(table) = VALUE zcl_binary_search=>integertab( ( 1 ) ( 3 ) ( 4 ) ( 6 ) ( 8 ) ( 9 ) ( 11 ) ).
    TRY.
        cut->binary_search(
          val = 0
          table = table ).
        cl_abap_unit_assert=>fail( 'Should have raised zcx_item_not_found' ).
      CATCH zcx_item_not_found.
    ENDTRY.
  ENDMETHOD.

  METHOD larger_than_max_not_found.
    DATA(table) = VALUE zcl_binary_search=>integertab( ( 1 ) ( 3 ) ( 4 ) ( 6 ) ( 8 ) ( 9 ) ( 11 ) ).
    TRY.
        cut->binary_search(
          val = 13
          table = table ).
        cl_abap_unit_assert=>fail( 'Should have raised zcx_item_not_found' ).
      CATCH zcx_item_not_found.
    ENDTRY.
  ENDMETHOD.

  METHOD nothing_found_in_empty_table.
    DATA(table) = VALUE zcl_binary_search=>integertab( ).
    TRY.
        cut->binary_search(
          val = 1
          table = table ).
        cl_abap_unit_assert=>fail( 'Should have raised zcx_item_not_found' ).
      CATCH zcx_item_not_found.
    ENDTRY.
  ENDMETHOD.

  METHOD not_found_when_bounds_cross.
    DATA(table) = VALUE zcl_binary_search=>integertab( ( 1 ) ( 2 ) ).
    TRY.
        cut->binary_search(
          val = 0
          table = table ).
        cl_abap_unit_assert=>fail( 'Should have raised zcx_item_not_found' ).
      CATCH zcx_item_not_found.
    ENDTRY.
  ENDMETHOD.

ENDCLASS.
