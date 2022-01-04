CLASS ltcl_raindrops DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT FINAL.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_raindrops.
    METHODS setup.
    METHODS test_number1 FOR TESTING RAISING cx_static_check.
    METHODS test_number2 FOR TESTING RAISING cx_static_check.
    METHODS test_pling FOR TESTING RAISING cx_static_check.
    METHODS test_plang FOR TESTING RAISING cx_static_check.
    METHODS test_plong FOR TESTING RAISING cx_static_check.
    METHODS test_plingplang FOR TESTING RAISING cx_static_check.

ENDCLASS.

CLASS ltcl_raindrops IMPLEMENTATION.

  METHOD setup.
    cut = NEW zcl_raindrops( ).
  ENDMETHOD.

  METHOD test_number1.
    cl_abap_unit_assert=>assert_equals(
      act = condense( cut->raindrops( 1 ) )
      exp = '1' ).
  ENDMETHOD.

  METHOD test_number2.
    cl_abap_unit_assert=>assert_equals(
      act = condense( cut->raindrops( 307 ) )
      exp = '307' ).
  ENDMETHOD.

  METHOD test_pling.
    cl_abap_unit_assert=>assert_equals(
      act = cut->raindrops( 303 )
      exp = 'Pling' ).
  ENDMETHOD.

  METHOD test_plang.
    cl_abap_unit_assert=>assert_equals(
      act = cut->raindrops( 230 )
      exp = 'Plang' ).
  ENDMETHOD.

  METHOD test_plong.
    cl_abap_unit_assert=>assert_equals(
      act = cut->raindrops( 679 )
      exp = 'Plong' ).
  ENDMETHOD.

  METHOD test_plingplang.
    cl_abap_unit_assert=>assert_equals(
      act = cut->raindrops( 30 )
      exp = 'PlingPlang' ).
  ENDMETHOD.

ENDCLASS.