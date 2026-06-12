CLASS zcl_freelancer_rates DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES amount TYPE p LENGTH 16 DECIMALS 6.
    TYPES discount_rate TYPE p LENGTH 8 DECIMALS 6.

    METHODS day_rate
      IMPORTING
        !rate_per_hour TYPE amount
      RETURNING
        VALUE(result)  TYPE amount .
    METHODS days_in_budget
      IMPORTING
        !budget        TYPE amount
        !rate_per_hour TYPE amount
      RETURNING
        VALUE(result)  TYPE i .
    METHODS price_with_monthly_discount
      IMPORTING
        !rate_per_hour TYPE amount
        !num_days      TYPE i
        !discount      TYPE discount_rate
      RETURNING
        VALUE(result)  TYPE i .
  PROTECTED SECTION.
  PRIVATE SECTION.
    CONSTANTS hours_per_day TYPE i VALUE 8.
    CONSTANTS billable_days_per_month TYPE i VALUE 22.
ENDCLASS.



CLASS zcl_freelancer_rates IMPLEMENTATION.

  METHOD day_rate.
    result = rate_per_hour * hours_per_day.
  ENDMETHOD.

  METHOD days_in_budget.
    result = floor( budget / day_rate( rate_per_hour ) ).
  ENDMETHOD.


  METHOD price_with_monthly_discount.
    DATA(full_months) = floor( num_days / billable_days_per_month ).
    DATA(monthly_rate) = billable_days_per_month * day_rate( rate_per_hour ).
    DATA(discounted_monthly_rate) = ( 1 - discount ) * monthly_rate.

    DATA(extra_days) = num_days MOD billable_days_per_month.
    DATA(extra_days_rate) = extra_days * day_rate( rate_per_hour ).

    result = ceil( full_months * discounted_monthly_rate + extra_days_rate ).
  ENDMETHOD.
ENDCLASS.
