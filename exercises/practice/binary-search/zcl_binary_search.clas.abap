CLASS zcl_binary_search DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES integertab TYPE STANDARD TABLE OF i WITH EMPTY KEY.
    METHODS binary_search
      IMPORTING
        val           TYPE i
        table         TYPE integertab
      RETURNING
        VALUE(result) TYPE i
      RAISING
        zcx_item_not_found.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_binary_search IMPLEMENTATION.

  METHOD binary_search.
    "Implement solution
  ENDMETHOD.
ENDCLASS.
