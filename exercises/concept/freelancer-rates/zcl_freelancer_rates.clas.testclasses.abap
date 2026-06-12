CLASS ltcl_freelancer_rates DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT FINAL.

  PRIVATE SECTION.

    DATA cut TYPE REF TO zcl_freelancer_rates.
    METHODS setup.
    METHODS test_day_rate_16 FOR TESTING RAISING cx_static_check.
    METHODS test_day_rate_25 FOR TESTING RAISING cx_static_check.
    METHODS test_day_rate_31_40 FOR TESTING RAISING cx_static_check.
    METHODS test_day_rate_89_89 FOR TESTING RAISING cx_static_check.
    METHODS test_day_rate_97_654321 FOR TESTING RAISING cx_static_check.
    METHODS test_days_budget_1280_16 FOR TESTING RAISING cx_static_check.
    METHODS test_days_budget_1280_25 FOR TESTING RAISING cx_static_check.
    METHODS test_days_budget_835_12 FOR TESTING RAISING cx_static_check.
    METHODS test_discount_16_70_0 FOR TESTING RAISING cx_static_check.
    METHODS test_discount_16_130_15 FOR TESTING RAISING cx_static_check.
    METHODS test_discount_29_220_112 FOR TESTING RAISING cx_static_check.
    METHODS test_discount_29_155_25 FOR TESTING RAISING cx_static_check.

ENDCLASS.

CLASS ltcl_freelancer_rates IMPLEMENTATION.

  METHOD setup.
    cut = NEW zcl_freelancer_rates( ).
  ENDMETHOD.

  METHOD test_day_rate_16.
    cl_abap_unit_assert=>assert_equals(
      act = cut->day_rate( 16 )
      exp = 128 ).
  ENDMETHOD.

  METHOD test_day_rate_25.
    cl_abap_unit_assert=>assert_equals(
      act = cut->day_rate( 25 )
      exp = 200 ).
  ENDMETHOD.

  METHOD test_day_rate_31_40.
    cl_abap_unit_assert=>assert_equals(
      act = cut->day_rate( CONV zcl_freelancer_rates=>amount( '31.4' ) )
      exp = CONV zcl_freelancer_rates=>amount( '251.2' ) ).
  ENDMETHOD.

  METHOD test_day_rate_89_89.
    cl_abap_unit_assert=>assert_equals(
      act = cut->day_rate( CONV zcl_freelancer_rates=>amount( '89.89' ) )
      exp = CONV zcl_freelancer_rates=>amount( '719.12' ) ).
  ENDMETHOD.

  METHOD test_day_rate_97_654321.
    cl_abap_unit_assert=>assert_equals(
      act = cut->day_rate( CONV zcl_freelancer_rates=>amount( '97.654321' ) )
      exp = CONV zcl_freelancer_rates=>amount( '781.234568' ) ).
  ENDMETHOD.

  METHOD test_days_budget_1280_16.
    cl_abap_unit_assert=>assert_equals(
      act = cut->days_in_budget(
              budget        = 1280
              rate_per_hour = 16 )
      exp = 10 ).
  ENDMETHOD.

  METHOD test_days_budget_1280_25.
    cl_abap_unit_assert=>assert_equals(
      act = cut->days_in_budget(
              budget        = 1280
              rate_per_hour = 25 )
      exp = 6 ).
  ENDMETHOD.

  METHOD test_days_budget_835_12.
    cl_abap_unit_assert=>assert_equals(
      act = cut->days_in_budget(
              budget        = 835
              rate_per_hour = 12 )
      exp = 8 ).
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
              discount      = CONV zcl_freelancer_rates=>discount_rate( '0.15' ) )
      exp = 14528 ).
  ENDMETHOD.

  METHOD test_discount_29_220_112.
    cl_abap_unit_assert=>assert_equals(
      act = cut->price_with_monthly_discount(
              rate_per_hour = CONV zcl_freelancer_rates=>amount( '29.654321' )
              num_days      = 220
              discount      = CONV zcl_freelancer_rates=>discount_rate( '0.112' ) )
      exp = 46347 ).
  ENDMETHOD.

  METHOD test_discount_29_155_25.
    cl_abap_unit_assert=>assert_equals(
      act = cut->price_with_monthly_discount(
              rate_per_hour = CONV zcl_freelancer_rates=>amount( '29.654321' )
              num_days      = 155
              discount      = CONV zcl_freelancer_rates=>discount_rate( '0.2547' ) )
      exp = 27467 ).
  ENDMETHOD.

ENDCLASS.
