CLASS ltcl_darts DEFINITION FOR TESTING DURATION SHORT RISK LEVEL HARMLESS FINAL.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_darts.
    METHODS setup.
    METHODS test_missed_target FOR TESTING RAISING cx_static_check.
    METHODS test_on_the_outer_circle FOR TESTING RAISING cx_static_check.
    METHODS test_on_the_middle_circle FOR TESTING RAISING cx_static_check.
    METHODS test_on_the_inner_circle FOR TESTING RAISING cx_static_check.
    METHODS test_exactly_on_centre FOR TESTING RAISING cx_static_check.
    METHODS test_near_the_centre FOR TESTING RAISING cx_static_check.
    METHODS test_just_within_the_inner FOR TESTING RAISING cx_static_check.
    METHODS test_just_outside_the_inner FOR TESTING RAISING cx_static_check.
    METHODS test_just_within_the_middle FOR TESTING RAISING cx_static_check.
    METHODS test_just_outside_the_middle FOR TESTING RAISING cx_static_check.
    METHODS test_just_within_the_outer FOR TESTING RAISING cx_static_check.
    METHODS test_just_outside_the_outer FOR TESTING RAISING cx_static_check.
    METHODS test_asymmetric_position FOR TESTING RAISING cx_static_check.



ENDCLASS.

CLASS ltcl_darts IMPLEMENTATION.

  METHOD setup.
    cut = NEW zcl_darts( ).
  ENDMETHOD.

"Missed target
  METHOD test_missed_target.
    cl_abap_unit_assert=>assert_equals(
      act = cut->score( x = -9 y  = 9 )
      exp = 0 ).
  ENDMETHOD.

"On the outer circle
  METHOD test_on_the_outer_circle.
    cl_abap_unit_assert=>assert_equals(
      act = cut->score( x = 0 y  = 10 )
      exp = 1 ).
  ENDMETHOD.

"On the middle circle
  METHOD test_on_the_middle_circle.
    cl_abap_unit_assert=>assert_equals(
      act = cut->score( x = -5 y  = 0 )
      exp = 5 ).
  ENDMETHOD.

"On the inner circle
  METHOD test_on_the_inner_circle.
    cl_abap_unit_assert=>assert_equals(
      act = cut->score( x = 0 y  = -1 )
      exp = 10 ).
  ENDMETHOD.

"Exactly on centre
  METHOD test_exactly_on_centre.
    cl_abap_unit_assert=>assert_equals(
      act = cut->score( x = 0 y  = 0 )
      exp = 10 ).
  ENDMETHOD.

"Near the centre
  METHOD test_near_the_centre.
    cl_abap_unit_assert=>assert_equals(
      act = cut->score( x = '-0.1' y = '-0.1' )
      exp = 10 ).
  ENDMETHOD.

"Just within the inner circle
  METHOD test_just_within_the_inner.
    cl_abap_unit_assert=>assert_equals(
      act = cut->score( x = '0.7' y  = '0.7' )
      exp = 10 ).
  ENDMETHOD.

"Just outside the inner circle
  METHOD test_just_outside_the_inner.
    cl_abap_unit_assert=>assert_equals(
      act = cut->score( x = '0.8' y  = '-0.8' )
      exp = 5 ).
  ENDMETHOD.

"Just within the middle circle
  METHOD test_just_within_the_middle.
    cl_abap_unit_assert=>assert_equals(
      act = cut->score( x = '-3.5' y  = '3.5' )
      exp = 5 ).
  ENDMETHOD.

"Just outside the middle circle
  METHOD test_just_outside_the_middle.
    cl_abap_unit_assert=>assert_equals(
      act = cut->score( x = '-3.6' y  = '3.6' )
      exp = 1 ).
  ENDMETHOD.

"Just within the outer circle
  METHOD test_just_within_the_outer.
    cl_abap_unit_assert=>assert_equals(
      act = cut->score( x = '-7.0' y  = '7.0' )
      exp = 1 ).
  ENDMETHOD.

"Just outside the outer circle
  METHOD test_just_outside_the_outer.
    cl_abap_unit_assert=>assert_equals(
      act = cut->score( x = '7.1' y  = '-7.1' )
      exp = 0 ).
  ENDMETHOD.

"Asymmetric position between the inner and middle circles
  METHOD test_asymmetric_position.
    cl_abap_unit_assert=>assert_equals(
      act = cut->score( x = '0.5' y  = -4 )
      exp = 5 ).
  ENDMETHOD.


ENDCLASS.
