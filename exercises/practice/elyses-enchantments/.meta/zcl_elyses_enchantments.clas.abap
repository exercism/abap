CLASS zcl_elyses_enchantments DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES ty_stack TYPE STANDARD TABLE OF i WITH EMPTY KEY.

    METHODS:

      "! Get card at position
      get_item
        IMPORTING stack         TYPE ty_stack
                  position      TYPE i
        RETURNING VALUE(result) TYPE i,

      "! Replace card at position
      set_item
        IMPORTING stack         TYPE ty_stack
                  position      TYPE i
                  replacement   TYPE i
        RETURNING VALUE(result) TYPE ty_stack,

      "Add card to stack
      insert_item_at_top
        IMPORTING stack         TYPE ty_stack
                  new_card      TYPE i
        RETURNING VALUE(result) TYPE ty_stack,

      "! Remove card at position
      remove_item
        IMPORTING stack         TYPE ty_stack
                  position      TYPE i
        RETURNING VALUE(result) TYPE ty_stack,

      "! Remove top card (last row)
      remove_item_from_top
        IMPORTING stack         TYPE ty_stack
        RETURNING VALUE(result) TYPE ty_stack,

      "! Add card to bottom of stack (first row)
      insert_item_at_bottom
        IMPORTING stack         TYPE ty_stack
                  new_card      TYPE i
        RETURNING VALUE(result) TYPE ty_stack,

      "! Remove bottom card (delete first row)
      remove_item_from_bottom
        IMPORTING stack         TYPE ty_stack
        RETURNING VALUE(result) TYPE ty_stack,

      "! Count cards
      get_size_of_stack
        IMPORTING stack         TYPE ty_stack
        RETURNING VALUE(result) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_elyses_enchantments IMPLEMENTATION.

  METHOD get_item.
    result = stack[ position ].
  ENDMETHOD.


  METHOD set_item.

    " abaplint issue #2452, can't do:
*    result = stack.
*    result[ position ] = replacement.

    " This doesn't work either:
*    result = stack.
*    read table result index position assigning field-symbol(<card>).
*    <card> = replacement.


    " Gotta go the old-old-fashioned way:

    CLEAR result.
    LOOP AT stack INTO DATA(card).
      IF sy-tabix = position.
        APPEND replacement TO result.
      ELSE.
        APPEND card TO result.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.


  METHOD insert_item_at_top.
    result = stack.
    APPEND new_card TO result.
  ENDMETHOD.


  METHOD get_size_of_stack.
    result = lines( stack ).
  ENDMETHOD.


  METHOD insert_item_at_bottom.
    result = stack.
    INSERT new_card INTO result INDEX 1.
  ENDMETHOD.


  METHOD remove_item.
    result = stack.
    DELETE result INDEX position.
  ENDMETHOD.


  METHOD remove_item_from_bottom.
    result = stack.
    DELETE result INDEX 1.
  ENDMETHOD.


  METHOD remove_item_from_top.
    result = stack.
    DELETE result INDEX lines( stack ).
  ENDMETHOD.


ENDCLASS.