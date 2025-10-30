CLASS ltcl_freelancer_rates DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT FINAL.

  PRIVATE SECTION.

    DATA cut TYPE REF TO zcl_freelancer_rates.
    METHODS setup.
    METHODS test_dayrate16 FOR TESTING RAISING cx_static_check.
    METHODS test_dayrate25 FOR TESTING RAISING cx_static_check.
    METHODS test_dayrate3140 FOR TESTING RAISING cx_static_check.
    METHODS test_dayrate8989 FOR TESTING RAISING cx_static_check.
    METHODS test_dayrate9765 FOR TESTING RAISING cx_static_check.
    METHODS test_daysinbudget_1280_16 FOR TESTING RAISING cx_static_check.
    METHODS test_daysinbudget_1280_25 FOR TESTING RAISING cx_static_check.
    METHODS test_daysinbudget_835_12 FOR TESTING RAISING cx_static_check.
    METHODS test_discount_16_70_0 FOR TESTING RAISING cx_static_check.
    METHODS test_discount_16_130_15 FOR TESTING RAISING cx_static_check.
    METHODS test_discount_29_220_112 FOR TESTING RAISING cx_static_check.
    METHODS test_discount_29_155_25 FOR TESTING RAISING cx_static_check.

ENDCLASS.

CLASS ltcl_freelancer_rates IMPLEMENTATION.

  METHOD setup.
    cut = NEW zcl_freelancer_rates( ).
  ENDMETHOD.

  METHOD test_dayrate16.
    cl_abap_unit_assert=>assert_equals(
      act = cut->day_rate( 16 )
      exp = 128 ).
  ENDMETHOD.

  METHOD test_dayrate25.
    cl_abap_unit_assert=>assert_equals(
      act = cut->day_rate( 25 )
      exp = 200 ).
  ENDMETHOD.

  METHOD test_dayrate3140.
    cl_abap_unit_assert=>assert_equals(
      act = cut->day_rate( '31.4' )
      exp = '251.2' ).
  ENDMETHOD.

  METHOD test_dayrate8989.
    cl_abap_unit_assert=>assert_equals(
      act = cut->day_rate( '89.89' )
      exp = '719.12' ).
  ENDMETHOD.

  METHOD test_dayrate9765.
    cl_abap_unit_assert=>assert_equals(
      act = cut->day_rate( '97.654321' )
      exp = '781.23' ).
  ENDMETHOD.

  METHOD test_daysinbudget_1280_16.
    cl_abap_unit_assert=>assert_equals(
      act = cut->days_in_budget(
              budget        = 1280
              rate_per_hour = 16 )
      exp = 10 ).
  ENDMETHOD.

  METHOD test_daysinbudget_1280_25.
    cl_abap_unit_assert=>assert_equals(
      act = cut->days_in_budget(
              budget        = 1280
              rate_per_hour = 16 )
      exp = 10 ).
  ENDMETHOD.

  METHOD test_daysinbudget_835_12.
    cl_abap_unit_assert=>assert_equals(
      act = cut->days_in_budget(
              budget        = 1280
              rate_per_hour = 16 )
      exp = 10 ).
  ENDMETHOD.

  METHOD test_discount_16_70_0.
    cl_abap_unit_assert=>assert_equals(
      act = cut->price_with_monthly_discount(
              rate_per_hour = 16
              num_days      = 70
              discount      = 0 )
      exp = 8960 ).
  ENDMETHOD.

  METHOD test_discount_16_130_15.
    cl_abap_unit_assert=>assert_equals(
      act = cut->price_with_monthly_discount(
              rate_per_hour = 16
              num_days      = 130
              discount      = '0.15' )
      exp = 14528 ).
  ENDMETHOD.

  METHOD test_discount_29_220_112.
    cl_abap_unit_assert=>assert_equals(
      act = cut->price_with_monthly_discount(
              rate_per_hour = '29.654321'
              num_days      = 220
              discount      = '0.112' )
      exp = 46346 ).
  ENDMETHOD.

  METHOD test_discount_29_155_25.
    cl_abap_unit_assert=>assert_equals(
      act = cut->price_with_monthly_discount(
              rate_per_hour = '29.654321'
              num_days      = 155
              discount      = '0.2547' )
      exp = 27466 ).
  ENDMETHOD.

ENDCLASS.
