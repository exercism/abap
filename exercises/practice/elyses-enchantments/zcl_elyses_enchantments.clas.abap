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
    "Implement solution here
  ENDMETHOD.


  METHOD set_item.
    "Implement solution here
  ENDMETHOD.


  METHOD insert_item_at_top.
    "Implement solution here
  ENDMETHOD.


  METHOD get_size_of_stack.
    "Implement solution here
  ENDMETHOD.


  METHOD insert_item_at_bottom.
    "Implement solution here
  ENDMETHOD.


  METHOD remove_item.
    "Implement solution here
  ENDMETHOD.


  METHOD remove_item_from_bottom.
    "Implement solution here
  ENDMETHOD.


  METHOD remove_item_from_top.
    "Implement solution here
  ENDMETHOD.

ENDCLASS.

