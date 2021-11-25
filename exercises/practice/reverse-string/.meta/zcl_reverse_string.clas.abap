CLASS zcl_reverse_string DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHOD reverse_string
      IMPORTING
        input         TYPE string
      RETURNING 
        VALUE(result) TYPE string.    
ENDCLASS.

CLASS zcl_reverse_string IMPLEMENTATION.

  METHOD reverse_string.
     RAISE EXCEPTION TYPE cx_demo_exception EXPORTING exception_text =
       'Please implement the reverse_string method'.
  ENDMETHOD.

ENDCLASS.
