CLASS ltcl_lasagne DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT FINAL.

    PRIVATE SECTION.
      DATA cut TYPE REF TO zcl_lasagne.
      METHODS setup.
      METHODS test_constant FOR TESTING RAISING cx_static_check.
      METHODS test_remaining_25 FOR TESTING RAISING cx_static_check.
      METHODS test_remaining_5 FOR TESTING RAISING cx_static_check.
      METHODS test_remaining_39 FOR TESTING RAISING cx_static_check.
      METHODS test_remaining_40 FOR TESTING RAISING cx_static_check.
      METHODS test_remaining_0 FOR TESTING RAISING cx_static_check.
      METHODS test_preparation_1 FOR TESTING RAISING cx_static_check.
      METHODS test_preparation_2 FOR TESTING RAISING cx_static_check.
      METHODS test_preparation_8 FOR TESTING RAISING cx_static_check.
      METHODS test_total_1_5 FOR TESTING RAISING cx_static_check.
      METHODS test_total_4_15 FOR TESTING RAISING cx_static_check.
      METHODS test_total_1_35 FOR TESTING RAISING cx_static_check.
  
  
  ENDCLASS.
  
  CLASS ltcl_lasagne IMPLEMENTATION.
  
    METHOD setup.
      cut = NEW zcl_lasagne( ).
    ENDMETHOD.
  
    METHOD test_constant.
      cl_abap_unit_assert=>assert_equals(
        act = cut->expected_minutes_in_oven
        exp = 40 ).
    ENDMETHOD.

    METHOD test_constant.
        cl_abap_unit_assert=>assert_equals(
          act = cut->preparation_minutes_per_layer
          exp = 2 ).
    ENDMETHOD.
  
    METHOD test_remaining_25.
      cl_abap_unit_assert=>assert_equals(
        act = cut->remaining_Minutes_In_Oven( 25 )
        exp = 15 ).
    ENDMETHOD.
  
    METHOD test_remaining_5.
      cl_abap_unit_assert=>assert_equals(
        act = cut->remaining_Minutes_In_Oven( 5 )
        exp = 35 ).
    ENDMETHOD.
  
    METHOD test_remaining_39.
      cl_abap_unit_assert=>assert_equals(
        act = cut->remaining_Minutes_In_Oven( 39 )
        exp = 1 ).
    ENDMETHOD.
  
    METHOD test_remaining_0.
      cl_abap_unit_assert=>assert_equals(
        act = cut->remaining_Minutes_In_Oven( 0 )
        exp = 40 ).
    ENDMETHOD.
  
    METHOD test_remaining_40.
      cl_abap_unit_assert=>assert_equals(
        act = cut->remaining_Minutes_In_Oven( 40 )
        exp = 0 ).
    ENDMETHOD.
  
    METHOD test_preparation_1.
      cl_abap_unit_assert=>assert_equals(
        act = cut->preparation_time_in_minutes( 1 )
        exp = 2 ).
    ENDMETHOD.
  
    METHOD test_preparation_2.
      cl_abap_unit_assert=>assert_equals(
        act = cut->preparation_time_in_minutes( 2 )
        exp = 4 ).
    ENDMETHOD.
  
    METHOD test_preparation_8.
      cl_abap_unit_assert=>assert_equals(
        act = cut->preparation_time_in_minutes( 8 )
        exp = 16 ).
    ENDMETHOD.
  
      METHOD test_total_1_5.
      cl_abap_unit_assert=>assert_equals(
        act = cut->total_time_in_minutes( number_of_layers = 1 actual_minutes_in_oven = 5 )
        exp = 7 ).
    ENDMETHOD.
  
        METHOD test_total_4_15.
      cl_abap_unit_assert=>assert_equals(
        act = cut->total_time_in_minutes( number_of_layers = 4 actual_minutes_in_oven = 15 )
        exp = 23 ).
    ENDMETHOD.
  
        METHOD test_total_1_35.
      cl_abap_unit_assert=>assert_equals(
        act = cut->total_time_in_minutes( number_of_layers = 1 actual_minutes_in_oven = 35 )
        exp = 37 ).
    ENDMETHOD.
  
  
  
  ENDCLASS.