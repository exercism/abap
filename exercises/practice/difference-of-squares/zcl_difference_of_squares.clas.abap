CLASS zcl_difference_of_squares DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS:
      ret_difference_of_squares IMPORTING num         TYPE i
                                RETURNING VALUE(diff) TYPE i,
      ret_sum_of_squares        IMPORTING num                   TYPE i
                                RETURNING VALUE(sum_of_squares) TYPE i,
      ret_square_of_sum         IMPORTING num                  TYPE i
                                RETURNING VALUE(square_of_sum) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_difference_of_squares IMPLEMENTATION.
  METHOD ret_difference_of_squares.
    "Implement solution
  ENDMETHOD.

  METHOD ret_sum_of_squares.
    "Implement solution
  ENDMETHOD.

  METHOD ret_square_of_sum.
    "Implement solution
  ENDMETHOD.
ENDCLASS.
