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
        VALUE(result)  TYPE amount.

    METHODS days_in_budget
      IMPORTING
        !budget        TYPE amount
        !rate_per_hour TYPE amount
      RETURNING
        VALUE(result)  TYPE i.

    METHODS price_with_monthly_discount
      IMPORTING
        !rate_per_hour TYPE amount
        !num_days      TYPE i
        !discount      TYPE discount_rate
      RETURNING
        VALUE(result)  TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_freelancer_rates IMPLEMENTATION.


  METHOD day_rate.
    "Implement solution here
  ENDMETHOD.


  METHOD days_in_budget.
    "Implement solution here
  ENDMETHOD.


  METHOD price_with_monthly_discount.
    "Implement solution here
  ENDMETHOD.
ENDCLASS.
