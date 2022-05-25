CLASS ltc_sign DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.

    DATA cut TYPE REF TO zcl_custom_signs.

    METHODS setup.

    METHODS occasion_is_birthday FOR TESTING RAISING cx_static_check.
    METHODS occasion_is_anniversary FOR TESTING RAISING cx_static_check.

ENDCLASS.


CLASS ltc_sign IMPLEMENTATION.

  METHOD setup.
    cut = NEW zcl_custom_signs( ).
  ENDMETHOD.

  METHOD occasion_is_birthday.
    cl_abap_unit_assert=>assert_equals(
      act = cut->build_sign(
              occasion = 'Birthday'
              name     = 'Jack' )
      exp = 'Happy Birthday Jack!' ).
  ENDMETHOD.

  METHOD occasion_is_anniversary.
    cl_abap_unit_assert=>assert_equals(
      act = cut->build_sign(
              occasion = 'Anniversary'
              name     = 'Jill' )
      exp = 'Happy Anniversary Jill!' ).
  ENDMETHOD.
ENDCLASS.


CLASS ltc_birthday DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.

    DATA cut TYPE REF TO zcl_custom_signs.

    METHODS setup.

    METHODS age_less_than_50 FOR TESTING RAISING cx_static_check.
    METHODS age_50 FOR TESTING RAISING cx_static_check.
    METHODS age_over_50 FOR TESTING RAISING cx_static_check.

ENDCLASS.


CLASS ltc_birthday IMPLEMENTATION.

  METHOD setup.
    cut = NEW zcl_custom_signs( ).
  ENDMETHOD.

  METHOD age_less_than_50.
    cl_abap_unit_assert=>assert_equals(
      act = cut->build_birthday_sign( 49 )
      exp = 'Happy Birthday! What a young fellow you are.' ).
  ENDMETHOD.

  METHOD age_50.
    cl_abap_unit_assert=>assert_equals(
      act = cut->build_birthday_sign( 50 )
      exp = 'Happy Birthday! What a mature fellow you are.' ).
  ENDMETHOD.

  METHOD age_over_50.
    cl_abap_unit_assert=>assert_equals(
      act = cut->build_birthday_sign( 51 )
      exp = 'Happy Birthday! What a mature fellow you are.' ).
  ENDMETHOD.

ENDCLASS.


CLASS ltc_graduation DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.

    DATA cut TYPE REF TO zcl_custom_signs.

    METHODS setup.

    METHODS rob_2021 FOR TESTING RAISING cx_static_check.
    METHODS jill_1999 FOR TESTING RAISING cx_static_check.

ENDCLASS.

CLASS ltc_graduation IMPLEMENTATION.


  METHOD setup.
    cut = NEW zcl_custom_signs( ).
  ENDMETHOD.


  METHOD rob_2021.
    cl_abap_unit_assert=>assert_equals(
        act = cut->graduation_for(
          name = 'Rob'
          year = '2021' )
        exp = |Congratulations Rob!\nClass of 2021| ).
  ENDMETHOD.


  METHOD jill_1999.
    cl_abap_unit_assert=>assert_equals(
      act = cut->graduation_for(
        name = 'Jill'
        year = '1999' )
      exp = |Congratulations Jill!\nClass of 1999| ).
  ENDMETHOD.

ENDCLASS.


CLASS ltc_cost DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.

    DATA cut TYPE REF TO zcl_custom_signs.

    METHODS setup.

    METHODS character_count FOR TESTING RAISING cx_static_check.
    METHODS line_breaks_included FOR TESTING RAISING cx_static_check.
    METHODS different_currency FOR TESTING RAISING cx_static_check.

ENDCLASS.

CLASS ltc_cost IMPLEMENTATION.


  METHOD setup.
    cut = NEW zcl_custom_signs( ).
  ENDMETHOD.


  METHOD character_count.
    cl_abap_unit_assert=>assert_equals(
      act = cut->cost_of(
        sign = |Happy Birthday!|
        currency = 'dollars' )
      exp = 'Your sign costs 50.00 dollars.' ).
  ENDMETHOD.


  METHOD line_breaks_included.
    cl_abap_unit_assert=>assert_equals(
      act = cut->cost_of(
        sign = |Congratulations Rob\nClass of 2021|
        currency = 'dollars' )
      exp = 'Your sign costs 86.00 dollars.' ).
  ENDMETHOD.


  METHOD different_currency.
    cl_abap_unit_assert=>assert_equals(
      act = cut->cost_of(
        sign = |Happy Easter, little sister!|
        currency = 'euros' )
      exp = 'Your sign costs 76.00 euros.' ).
  ENDMETHOD.


ENDCLASS.
