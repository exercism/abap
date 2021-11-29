CLASS zcl_hello_world_example DEFINITION PUBLIC.
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcl_hello_world_example IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    out->write( 'Hello, World!' ).
  ENDMETHOD.

ENDCLASS.