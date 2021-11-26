CLASS zcl_clock DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.

    METHODS constructor
      IMPORTING
        !hours   TYPE i
        !minutes TYPE i DEFAULT 0.
    METHODS get
      RETURNING
        VALUE(result) TYPE string.
    METHODS add
      IMPORTING
        !minutes TYPE i.
    METHODS sub
      IMPORTING
        !minutes TYPE i.

  PRIVATE SECTION.

* Keep clock state in instance variable

ENDCLASS.



CLASS zcl_clock IMPLEMENTATION.


  METHOD add.
    " add minutes to the clock
  ENDMETHOD.


  METHOD constructor.
    " implement the constructor
  ENDMETHOD.


  METHOD get.
    " return clock as hh:mm
  ENDMETHOD.


  METHOD sub.
    " substract minutes from clock
  ENDMETHOD.
ENDCLASS.
