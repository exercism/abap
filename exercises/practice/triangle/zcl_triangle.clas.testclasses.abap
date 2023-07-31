*"* use this source file for your ABAP unit test classes
CLASS ltcl_triangle DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_triangle.
    METHODS setup.
    METHODS:
      equi_all_sides_equal           FOR TESTING RAISING cx_static_check,
      equi_any_side_is_unequal       FOR TESTING RAISING cx_static_check,
      equi_no_sides_equal            FOR TESTING RAISING cx_static_check,
      equi_all_zero_sides_not_tri    FOR TESTING RAISING cx_static_check,
      equi_sides_may_be_floats       FOR TESTING RAISING cx_static_check,
      isos_last_two_sides_equal      FOR TESTING RAISING cx_static_check,
      isos_first_two_sides_equal     FOR TESTING RAISING cx_static_check,
      isos_first_last_sides_equal    FOR TESTING RAISING cx_static_check,
      isos_equi_triangles_also_isos  FOR TESTING RAISING cx_static_check,
      isos_no_sides_equal            FOR TESTING RAISING cx_static_check,
      isos_first_tri_ineq_violation  FOR TESTING RAISING cx_static_check,
      isos_second_tri_ineq_violation FOR TESTING RAISING cx_static_check,
      isos_third_tri_ineq_violation  FOR TESTING RAISING cx_static_check,
      isos_sides_may_be_floats       FOR TESTING RAISING cx_static_check,
      scal_no_sides_equal            FOR TESTING RAISING cx_static_check,
      scal_all_sides_equal           FOR TESTING RAISING cx_static_check,
      scal_first_second_sides_equal  FOR TESTING RAISING cx_static_check,
      scal_first_third_sides_equal   FOR TESTING RAISING cx_static_check,
      scal_second_third_sides_equal  FOR TESTING RAISING cx_static_check,
      scal_may_not_violate_tri_ineq  FOR TESTING RAISING cx_static_check,
      scal_sides_may_be_floats       FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltcl_triangle IMPLEMENTATION.
  METHOD setup.
    cut = NEW zcl_triangle( ).
  ENDMETHOD.

  METHOD equi_all_sides_equal.
    cl_abap_unit_assert=>assert_equals(
      exp = abap_true
      act = cut->is_equilateral( side_a = '2.0'
                                 side_b = '2.0'
                                 side_c = '2.0' ) ).
  ENDMETHOD.

  METHOD equi_any_side_is_unequal.
    cl_abap_unit_assert=>assert_equals(
      exp = abap_false
      act = cut->is_equilateral( side_a = '4.0'
                                 side_b = '4.0'
                                 side_c = '6.0' ) ).
  ENDMETHOD.

  METHOD equi_no_sides_equal.
    cl_abap_unit_assert=>assert_equals(
      exp = abap_false
      act = cut->is_equilateral( side_a = '4.0'
                                 side_b = '5.0'
                                 side_c = '6.0' ) ).
  ENDMETHOD.

  METHOD equi_all_zero_sides_not_tri.
    TRY.
        cut->is_equilateral( side_a = '0.0'
                             side_b = '0.0'
                             side_c = '0.0' ).
        cl_abap_unit_assert=>fail( ).
      CATCH cx_parameter_invalid.
    ENDTRY.
  ENDMETHOD.

  METHOD equi_sides_may_be_floats.
    cl_abap_unit_assert=>assert_equals(
      exp = abap_true
      act = cut->is_equilateral( side_a = '1.5'
                                 side_b = '1.5'
                                 side_c = '1.5' ) ).
  ENDMETHOD.

  METHOD isos_last_two_sides_equal.
    cl_abap_unit_assert=>assert_equals(
      exp = abap_true
      act = cut->is_isosceles( side_a = '6.0'
                               side_b = '4.0'
                               side_c = '4.0' ) ).
  ENDMETHOD.

  METHOD isos_first_two_sides_equal.
    cl_abap_unit_assert=>assert_equals(
      exp = abap_true
      act = cut->is_isosceles( side_a = '4.0'
                               side_b = '4.0'
                               side_c = '6.0' ) ).
  ENDMETHOD.

  METHOD isos_first_last_sides_equal.
    cl_abap_unit_assert=>assert_equals(
      exp = abap_true
      act = cut->is_isosceles( side_a = '4.0'
                               side_b = '6.0'
                               side_c = '4.0' ) ).
  ENDMETHOD.

  METHOD isos_equi_triangles_also_isos.
    cl_abap_unit_assert=>assert_equals(
      exp = abap_true
      act = cut->is_isosceles( side_a = '4.0'
                               side_b = '4.0'
                               side_c = '4.0' ) ).
  ENDMETHOD.

  METHOD isos_no_sides_equal.
    cl_abap_unit_assert=>assert_equals(
      exp = abap_false
      act = cut->is_isosceles( side_a = '4.0'
                               side_b = '5.0'
                               side_c = '6.0' ) ).
  ENDMETHOD.

  METHOD isos_first_tri_ineq_violation.
    TRY.
        cut->is_isosceles( side_a = '1.0'
                           side_b = '1.0'
                           side_c = '3.0' ).
        cl_abap_unit_assert=>fail( ).
      CATCH cx_parameter_invalid.
    ENDTRY.
  ENDMETHOD.

  METHOD isos_second_tri_ineq_violation.
    TRY.
        cut->is_isosceles( side_a = '1.0'
                           side_b = '3.0'
                           side_c = '1.0' ).
        cl_abap_unit_assert=>fail( ).
      CATCH cx_parameter_invalid.
    ENDTRY.
  ENDMETHOD.

  METHOD isos_third_tri_ineq_violation.
    TRY.
        cut->is_isosceles( side_a = '3.0'
                           side_b = '1.0'
                           side_c = '1.0' ).
        cl_abap_unit_assert=>fail( ).
      CATCH cx_parameter_invalid.
    ENDTRY.
  ENDMETHOD.

  METHOD isos_sides_may_be_floats.
    cl_abap_unit_assert=>assert_equals(
      exp = abap_true
      act = cut->is_isosceles( side_a = '1.5'
                               side_b = '1.5'
                               side_c = '2.5' ) ).
  ENDMETHOD.

  METHOD scal_no_sides_equal.
    cl_abap_unit_assert=>assert_equals(
      exp = abap_true
      act = cut->is_isosceles( side_a = '4.0'
                               side_b = '5.0'
                               side_c = '6.0' ) ).
  ENDMETHOD.

  METHOD scal_all_sides_equal.
    cl_abap_unit_assert=>assert_equals(
      exp = abap_false
      act = cut->is_scalene( side_a = '2.0'
                             side_b = '2.0'
                             side_c = '2.0' ) ).
  ENDMETHOD.

  METHOD scal_first_second_sides_equal.
    cl_abap_unit_assert=>assert_equals(
      exp = abap_false
      act = cut->is_scalene( side_a = '4.0'
                             side_b = '4.0'
                             side_c = '6.0' ) ).
  ENDMETHOD.

  METHOD scal_first_third_sides_equal.
    cl_abap_unit_assert=>assert_equals(
      exp = abap_false
      act = cut->is_scalene( side_a = '4.0'
                             side_b = '6.0'
                             side_c = '4.0' ) ).
  ENDMETHOD.

  METHOD scal_second_third_sides_equal.
    cl_abap_unit_assert=>assert_equals(
      exp = abap_false
      act = cut->is_scalene( side_a = '6.0'
                             side_b = '4.0'
                             side_c = '4.0' ) ).
  ENDMETHOD.

  METHOD scal_may_not_violate_tri_ineq.
    TRY.
        cut->is_scalene( side_a = '4.0'
                         side_b = '8.0'
                         side_c = '3.0' ).
        cl_abap_unit_assert=>fail( ).
      CATCH cx_parameter_invalid.
    ENDTRY.
  ENDMETHOD.

  METHOD scal_sides_may_be_floats.
    cl_abap_unit_assert=>assert_equals(
      exp = abap_true
      act = cut->is_scalene( side_a = '4.5'
                             side_b = '5.5'
                             side_c = '6.5' ) ).
  ENDMETHOD.

ENDCLASS.
