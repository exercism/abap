CLASS zcl_knapsack DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES: BEGIN OF item_type,
             weight TYPE i,
             value  TYPE i,
           END OF item_type.
    TYPES items_type TYPE TABLE OF item_type.

    METHODS get_max_possible_value
      IMPORTING weight_limit     TYPE i
                items            TYPE items_type
      RETURNING VALUE(max_value) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_knapsack IMPLEMENTATION.


  METHOD get_max_possible_value.
    " add solution here
  ENDMETHOD.
ENDCLASS.
