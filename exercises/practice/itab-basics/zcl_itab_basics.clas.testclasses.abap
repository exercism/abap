CLASS ltcl_itab_basics DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT FINAL.
  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_itab_basics.
    METHODS setup.
    METHODS test_fill_itab FOR TESTING RAISING cx_static_check.
    METHODS test_add_to_itab_empty FOR TESTING RAISING cx_static_check.
    METHODS test_add_to_itab FOR TESTING RAISING cx_static_check.
    METHODS test_sort_itab_empty FOR TESTING RAISING cx_static_check.
    METHODS test_sort_itab FOR TESTING RAISING cx_static_check.
    METHODS test_search_itab_empty FOR TESTING RAISING cx_static_check.
    METHODS test_search_itab FOR TESTING RAISING cx_static_check.
ENDCLASS.
CLASS ltcl_itab_basics IMPLEMENTATION.

  METHOD setup.
    cut = NEW zcl_itab_basics( ).
  ENDMETHOD.

  METHOD test_fill_itab.

    DATA(actual) = cut->fill_itab( ).
    cl_abap_unit_assert=>assert_not_initial( actual ).

    DATA(expected_values) = VALUE zcl_itab_basics=>itab_data_type(
        ( group = 'A' number = 10  description = 'Group A-2' )
        ( group = 'B' number = 5   description = 'Group B' )
        ( group = 'A' number = 6   description = 'Group A-1' )
        ( group = 'C' number = 22  description = 'Group C-1' )
        ( group = 'A' number = 13  description = 'Group A-3' )
        ( group = 'C' number = 500 description = 'Group C-2' ) ).

    cl_abap_unit_assert=>assert_equals(
      act = cut->fill_itab( )
      exp = expected_values ).

  ENDMETHOD.

  METHOD test_add_to_itab_empty.

    cl_abap_unit_assert=>assert_equals(
      act = lines( cut->add_to_itab( VALUE #( ) ) )
      exp = 1 ).

  ENDMETHOD.


  METHOD test_add_to_itab.

    DATA(expected_values) = VALUE zcl_itab_basics=>itab_data_type(
      ( group = 'A' number = 10  description = 'Group A-2' )
      ( group = 'B' number = 5   description = 'Group B' )
      ( group = 'A' number = 6   description = 'Group A-1' )
      ( group = 'C' number = 22  description = 'Group C-1' )
      ( group = 'A' number = 13  description = 'Group A-3' )
      ( group = 'C' number = 500 description = 'Group C-2' )
      ( group = 'A' number = 19  description = 'Group A-4' ) ).

    cl_abap_unit_assert=>assert_equals(
      act = cut->add_to_itab( cut->fill_itab( ) )
      exp = expected_values ).

  ENDMETHOD.

  METHOD test_sort_itab_empty.
    cl_abap_unit_assert=>assert_equals(
      act = cut->sort_itab( VALUE #( ) )
      exp = VALUE zcl_itab_basics=>itab_data_type( ) ).
  ENDMETHOD.

  METHOD test_sort_itab.
    DATA(expected_values) = VALUE zcl_itab_basics=>itab_data_type(
      ( group = 'A' number = 19  description = 'Group A-4' )
      ( group = 'A' number = 13  description = 'Group A-3' )
      ( group = 'A' number = 10  description = 'Group A-2' )
      ( group = 'A' number = 6   description = 'Group A-1' )
      ( group = 'B' number = 5   description = 'Group B' )
      ( group = 'C' number = 500 description = 'Group C-2' )
      ( group = 'C' number = 22  description = 'Group C-1' ) ).

    cl_abap_unit_assert=>assert_equals(
      act = cut->sort_itab( cut->add_to_itab( cut->fill_itab( ) ) )
      exp = expected_values ).
  ENDMETHOD.

  METHOD test_search_itab_empty.
    cl_abap_unit_assert=>assert_equals(
      act = cut->search_itab( VALUE #( ) )
      exp = 0 ).
  ENDMETHOD.

  METHOD test_search_itab.
    cl_abap_unit_assert=>assert_equals(
      act = cut->search_itab( cut->sort_itab( cut->add_to_itab( cut->fill_itab( ) ) ) )
      exp = 4 ).
  ENDMETHOD.
ENDCLASS.
