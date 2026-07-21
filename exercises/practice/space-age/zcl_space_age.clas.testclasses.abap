CLASS ltcl_space_age DEFINITION FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_space_age.
    METHODS setup.
    METHODS assert_age
      IMPORTING
        planet   TYPE string
        seconds  TYPE i
        expected TYPE zcl_space_age=>age_in_years
      RAISING
        cx_static_check.
    METHODS test_age_on_earth FOR TESTING RAISING cx_static_check.
    METHODS test_age_on_mercury FOR TESTING RAISING cx_static_check.
    METHODS test_age_on_venus FOR TESTING RAISING cx_static_check.
    METHODS test_age_on_mars FOR TESTING RAISING cx_static_check.
    METHODS test_age_on_jupiter FOR TESTING RAISING cx_static_check.
    METHODS test_age_on_saturn FOR TESTING RAISING cx_static_check.
    METHODS test_age_on_uranus FOR TESTING RAISING cx_static_check.
    METHODS test_age_on_neptune FOR TESTING RAISING cx_static_check.
    METHODS test_invalid_planet FOR TESTING.

ENDCLASS.


CLASS ltcl_space_age IMPLEMENTATION.

  METHOD setup.
    cut = NEW zcl_space_age( ).
  ENDMETHOD.

  METHOD assert_age.
    cl_abap_unit_assert=>assert_equals(
      act = cut->age(
              planet  = planet
              seconds = seconds )
      exp = expected ).
  ENDMETHOD.

  METHOD test_age_on_earth.
    assert_age(
      planet   = 'Earth'
      seconds  = 1000000000
      expected = '31.69' ).
  ENDMETHOD.

  METHOD test_age_on_mercury.
    assert_age(
      planet   = 'Mercury'
      seconds  = 2134835688
      expected = '280.88' ).
  ENDMETHOD.

  METHOD test_age_on_venus.
    assert_age(
      planet   = 'Venus'
      seconds  = 189839836
      expected = '9.78' ).
  ENDMETHOD.

  METHOD test_age_on_mars.
    assert_age(
      planet   = 'Mars'
      seconds  = 2129871239
      expected = '35.88' ).
  ENDMETHOD.

  METHOD test_age_on_jupiter.
    assert_age(
      planet   = 'Jupiter'
      seconds  = 901876382
      expected = '2.41' ).
  ENDMETHOD.

  METHOD test_age_on_saturn.
    assert_age(
      planet   = 'Saturn'
      seconds  = 2000000000
      expected = '2.15' ).
  ENDMETHOD.

  METHOD test_age_on_uranus.
    assert_age(
      planet   = 'Uranus'
      seconds  = 1210123456
      expected = '0.46' ).
  ENDMETHOD.

  METHOD test_age_on_neptune.
    assert_age(
      planet   = 'Neptune'
      seconds  = 1821023456
      expected = '0.35' ).
  ENDMETHOD.

  METHOD test_invalid_planet.
    TRY.
        cut->age(
          planet  = 'Sun'
          seconds = 680804807 ).
        cl_abap_unit_assert=>fail( ).
      CATCH cx_parameter_invalid.
    ENDTRY.
  ENDMETHOD.


ENDCLASS.
