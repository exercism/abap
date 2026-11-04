CLASS zcl_relative_distance DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES:
      BEGIN OF ty_family,
        parent   TYPE string,
        children TYPE string_table,
      END OF ty_family,
      ty_family_tree TYPE STANDARD TABLE OF ty_family WITH KEY parent.

    METHODS degree_of_separation
      IMPORTING
        family_tree   TYPE ty_family_tree
        person_a      TYPE string
        person_b      TYPE string
      RETURNING
        VALUE(result) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_relative_distance IMPLEMENTATION.
  METHOD degree_of_separation.
    " add solution here
  ENDMETHOD.


ENDCLASS.
