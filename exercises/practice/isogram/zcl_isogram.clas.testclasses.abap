CLASS ltcl_isogram DEFINITION FOR TESTING DURATION SHORT RISK LEVEL HARMLESS FINAL.

  PRIVATE SECTION.
    DATA mo_cut TYPE REF TO zcl_isogram.

    METHODS setup.
    METHODS is_isogram1 FOR TESTING RAISING cx_static_check.
    METHODS is_isogram2 FOR TESTING RAISING cx_static_check.
    METHODS is_isogram3 FOR TESTING RAISING cx_static_check.
    METHODS is_isogram4 FOR TESTING RAISING cx_static_check.
    METHODS is_not_isogram1 FOR TESTING RAISING cx_static_check.
    METHODS is_not_isogram2 FOR TESTING RAISING cx_static_check.
    METHODS is_not_isogram3 FOR TESTING RAISING cx_static_check.
ENDCLASS.

CLASS ltcl_isogram IMPLEMENTATION.

  METHOD setup.
    mo_cut = NEW #( ).
  ENDMETHOD.

  METHOD is_isogram1.
    cl_abap_unit_assert=>assert_equals(
      act = mo_cut->is_isogram( 'lumberjacks' )
      exp = abap_true ).
  ENDMETHOD.

  METHOD is_isogram2.
    cl_abap_unit_assert=>assert_equals(
      act = mo_cut->is_isogram( 'back ground' )
      exp = abap_true ).
  ENDMETHOD.

  METHOD is_isogram3.
    cl_abap_unit_assert=>assert_equals(
      act = mo_cut->is_isogram( 'six-year-old' )
      exp = abap_true ).
  ENDMETHOD.

  METHOD is_isogram4.
    cl_abap_unit_assert=>assert_equals(
      act = mo_cut->is_isogram( '' )
      exp = abap_true ).
  ENDMETHOD.

  METHOD is_not_isogram1.
    cl_abap_unit_assert=>assert_equals(
      act = mo_cut->is_isogram( 'Advanced Business Application Programming' )
      exp = abap_false ).
  ENDMETHOD.

  METHOD is_not_isogram2.
    cl_abap_unit_assert=>assert_equals(
      act = mo_cut->is_isogram( 'Alphabet' )
      exp = abap_false ).
  ENDMETHOD.

  METHOD is_not_isogram3.
    cl_abap_unit_assert=>assert_equals(
      act = mo_cut->is_isogram( 'Cloud-Application' )
      exp = abap_false ).
  ENDMETHOD.

ENDCLASS.