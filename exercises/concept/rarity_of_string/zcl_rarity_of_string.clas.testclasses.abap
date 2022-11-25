CLASS ltcl_rarity_of_string DEFINITION
  FOR TESTING
  RISK LEVEL HARMLESS
  DURATION SHORT.
  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_rarity_of_string.
    METHODS setup.
    METHODS rarity FOR TESTING.
    METHODS aardvark FOR TESTING.
    METHODS quine FOR TESTING.
    METHODS wow FOR TESTING.
    METHODS why FOR TESTING.
    METHODS puppy FOR TESTING.
    METHODS abap FOR TESTING.
ENDCLASS.

CLASS ltcl_rarity_of_string IMPLEMENTATION.

  METHOD setup.
    cut = NEW #( ).
  ENDMETHOD.

  METHOD rarity.
    cl_abap_unit_assert=>assert_equals(
        act = cut->compute( 'rarity' )
        exp = -9 ).
  ENDMETHOD.

  METHOD aardvark.
    cl_abap_unit_assert=>assert_equals(
        act = cut->compute( 'aardvark' )
        exp = -8 ).
  ENDMETHOD.

  METHOD quine.
    cl_abap_unit_assert=>assert_equals(
        act = cut->compute( 'quine' )
        exp = -4 ).
  ENDMETHOD.

  METHOD wow.
    cl_abap_unit_assert=>assert_equals(
        act = cut->compute( 'wow' )
        exp = -1 ).
  ENDMETHOD.

  METHOD why.
    cl_abap_unit_assert=>assert_equals(
        act = cut->compute( 'why' )
        exp = 0 ).
  ENDMETHOD.

  METHOD puppy.
    cl_abap_unit_assert=>assert_equals(
        act = cut->compute( 'puppy' )
        exp = 7 ).
  ENDMETHOD.

  METHOD abap.
    cl_abap_unit_assert=>assert_equals(
        act = cut->compute( 'abap' )
        exp = -2 ).
  ENDMETHOD.

ENDCLASS.
