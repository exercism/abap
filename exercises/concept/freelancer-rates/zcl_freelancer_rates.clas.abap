CLASS zcl_freelancer_rates DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS day_rate
      IMPORTING
        !rate_per_hour TYPE f
      RETURNING
        VALUE(result)  TYPE f.

    METHODS days_in_budget
      IMPORTING
        !budget        TYPE f
        !rate_per_hour TYPE f
      RETURNING
        VALUE(result)  TYPE i.

    METHODS price_with_monthly_discount
      IMPORTING
        !rate_per_hour TYPE f
        !num_days      TYPE f
        !discount      TYPE f
      RETURNING
        VALUE(result)  TYPE f.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_freelancer_rates IMPLEMENTATION.


  METHOD days_in_budget.
* add solution here
  ENDMETHOD.


  METHOD day_rate.
* add solution here
  ENDMETHOD.


  METHOD price_with_monthly_discount.
* add solution here
  ENDMETHOD.
ENDCLASS.
