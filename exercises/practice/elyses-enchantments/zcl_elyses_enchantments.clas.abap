CLASS zcl_elyses_enchantments DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES ty_deck TYPE STANDARD TABLE OF i WITH EMPTY KEY.

    METHODS:

      get_item
        IMPORTING deck          TYPE ty_deck
                  position      TYPE i
        RETURNING VALUE(result) TYPE i,

      set_item
        IMPORTING deck          TYPE ty_deck
                  position      TYPE i
                  replacement   TYPE i
        RETURNING VALUE(result) TYPE ty_deck,

      insert_item_at_top
        IMPORTING deck          TYPE ty_deck
                  new_card      TYPE i
        RETURNING VALUE(result) TYPE ty_deck,

      remove_item
        IMPORTING deck          TYPE ty_deck
                  position      TYPE i
        RETURNING VALUE(result) TYPE ty_deck,

      remove_item_from_top
        IMPORTING deck          TYPE ty_deck
        RETURNING VALUE(result) TYPE ty_deck,

      insert_item_at_bottom
        IMPORTING deck          TYPE ty_deck
                  new_card      TYPE i
        RETURNING VALUE(result) TYPE ty_deck,

      remove_item_at_bottom
        IMPORTING deck          TYPE ty_deck
        RETURNING VALUE(result) TYPE ty_deck,

      get_size_of_stack
        IMPORTING deck          TYPE ty_deck
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

  METHOD remove_item_at_bottom.
    "Implement solution here
  ENDMETHOD.

  METHOD remove_item_from_top.
    "Implement solution here
  ENDMETHOD.

ENDCLASS.