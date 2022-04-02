CLASS zcl_hello_world DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS hello RETURNING VALUE(result) TYPE string.
ENDCLASS.

CLASS zcl_hello_world IMPLEMENTATION.

  METHOD hello.
    result = 'Hello, World!'.
  ENDMETHOD.

ENDCLASS.