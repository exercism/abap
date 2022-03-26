CLASS zcl_freelancer_rates DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS day_rate
      IMPORTING
        !rate_per_hour TYPE f
      RETURNING
        VALUE(result)  TYPE f .
    METHODS days_in_budget
      IMPORTING
        !budget        TYPE f
        !rate_per_hour TYPE f
      RETURNING
        VALUE(result)  TYPE i .
    METHODS price_with_monthly_discount
      IMPORTING
        !rate_per_hour TYPE f
        !num_days      TYPE f
        !discount      TYPE f
      RETURNING
        VALUE(result)  TYPE f .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_freelancer_rates IMPLEMENTATION.



  METHOD day_rate.
    result = round( val  = rate_per_hour * 8 dec = 2 ) .
  ENDMETHOD.

  METHOD days_in_budget.
    result = floor( budget / day_rate( rate_per_hour ) ).
  ENDMETHOD.


  METHOD price_with_monthly_discount.
    DATA(lv_months) = floor( num_days / 22 ).
    DATA(lv_monthly_rate) = 22 * day_rate( rate_per_hour ).
    DATA(lv_monthly_discount_rate) = ( 1 - discount ) * lv_monthly_rate.

    DATA(lv_extra_days) = num_days MOD 22.
    DATA(lv_price_extra_days) = lv_extra_days * day_rate( rate_per_hour ).

    result = ceil( lv_months * lv_monthly_discount_rate + lv_price_extra_days ).
  ENDMETHOD.
ENDCLASS.