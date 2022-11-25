CLASS zcl_rarity_of_string DEFINITION
  PUBLIC
  CREATE PUBLIC.
  
  PUBLIC SECTION.
  
    METHODS compute
      IMPORTING
        string        TYPE string
      RETURNING 
        VALUE(result) TYPE i.

ENDCLASS.

CLASS zcl_rarity_of_string IMPLEMENTATION.

  METHOD compute.
    DATA(str) = to_upper( string ).
    result = REDUCE #( INIT num = 0 FOR i = 0 UNTIL i = strlen( string )
      NEXT num = num + COND #(
        WHEN str+i(1) CA 'EATO' THEN -3
        WHEN str+i(1) CA 'INSH' THEN -2
        WHEN str+i(1) CA 'RDLC' THEN -1
        WHEN str+i(1) CA 'WFGY' THEN 1
        WHEN str+i(1) CA 'KVBP' THEN 2
        WHEN str+i(1) CA 'JQXZ' THEN 3 ) ).
  ENDMETHOD.
  
ENDCLASS.
