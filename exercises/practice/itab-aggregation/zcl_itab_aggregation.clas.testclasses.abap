CLASS ltcl_itab_aggregation DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT FINAL.
  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_itab_aggregation.
    METHODS setup.
    METHODS test_aggregation_empty FOR TESTING RAISING cx_static_check.
    METHODS test_aggregation FOR TESTING RAISING cx_static_check.
    METHODS test_aggregation_extended FOR TESTING RAISING cx_static_check.
ENDCLASS.
CLASS ltcl_itab_aggregation IMPLEMENTATION.
  METHOD setup.
    cut = NEW zcl_itab_aggregation( ).
  ENDMETHOD.

  METHOD test_aggregation_empty.
    cl_abap_unit_assert=>assert_equals(
      act = cut->perform_aggregation( VALUE #( ) )
      exp = VALUE zcl_itab_aggregation=>aggregated_data( )
      msg = `No Cheating!` ).
  ENDMETHOD.

  METHOD test_aggregation.
    DATA(actual_values) = VALUE zcl_itab_aggregation=>initial_numbers(
        ( group = 'A' number = 10 )
        ( group = 'B' number = 5 )
        ( group = 'A' number = 6 )
        ( group = 'C' number = 22 )
        ( group = 'A' number = 13 )
        ( group = 'C' number = 500 ) ).

    DATA(expected_values) = VALUE zcl_itab_aggregation=>aggregated_data(
        ( group = 'A' count = 3 sum = 29 min = 6 max = 13 average = 29 / 3 )
        ( group = 'B' count = 1 sum = 5 min = 5 max = 5 average = 5 / 1 )
        ( group = 'C' count = 2 sum = 522 min = 22 max = 500 average = 522 / 2 ) ).

    cl_abap_unit_assert=>assert_equals(
      act = cut->perform_aggregation( actual_values )
      exp = expected_values ).
  ENDMETHOD.

  METHOD test_aggregation_extended.
    DATA(actual_values) = VALUE zcl_itab_aggregation=>initial_numbers(
        ( group = 'D' number = 10 )
        ( group = 'E' number = 10 )
        ( group = 'D' number = 6 )
        ( group = 'F' number = 22 )
        ( group = 'D' number = 13 )
        ( group = 'F' number = 500 ) ).
    DATA(expected_values) = VALUE zcl_itab_aggregation=>aggregated_data(
        ( group = 'D' count = 3 sum = 29 min = 6 max = 13 average = 29 / 3 )
        ( group = 'E' count = 1 sum = 10 min = 10 max = 10 average = 10 / 1 )
        ( group = 'F' count = 2 sum = 522 min = 22 max = 500 average = 522 / 2 ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->perform_aggregation( actual_values )
      exp = expected_values ).
  ENDMETHOD.
ENDCLASS.
