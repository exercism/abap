CLASS zcl_lasagne DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CONSTANTS expected_minutes_in_oven TYPE i VALUE 40 .
    CONSTANTS preparation_minutes_per_layer  TYPE i VALUE 2 .

    METHODS remaining_minutes_in_oven
      IMPORTING
        !actual_minutes_in_oven TYPE i
      RETURNING
        VALUE(result)           TYPE i .
    METHODS preparation_time_in_minutes
      IMPORTING
        !number_of_layers TYPE i
      RETURNING
        VALUE(result)     TYPE i .
    METHODS total_time_in_minutes
      IMPORTING
        !number_of_layers       TYPE i
        !actual_minutes_in_oven TYPE i
      RETURNING
        VALUE(result)           TYPE i .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lasagne IMPLEMENTATION.

  METHOD remaining_minutes_in_oven.
    result = expected_minutes_in_oven - actual_minutes_in_oven.
  ENDMETHOD.

  METHOD preparation_time_in_minutes.
    result = number_of_layers * preparation_minutes_per_layer.
  ENDMETHOD.

  METHOD total_time_in_minutes.
    result = preparation_time_in_minutes( number_of_layers ) + actual_minutes_in_oven.
  ENDMETHOD.
ENDCLASS.