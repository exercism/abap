CLASS zcl_acronym_example DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS parse IMPORTING phrase         TYPE string
                  RETURNING VALUE(acronym) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_acronym_example IMPLEMENTATION.
  METHOD parse.
    DATA(str) = phrase.
    REPLACE ALL OCCURRENCES OF REGEX '-' IN str WITH ` `.
    REPLACE ALL OCCURRENCES OF REGEX '['',_,]' IN str WITH ``.

    SPLIT str AT space INTO TABLE DATA(ph_tab).
    DELETE ph_tab WHERE table_line IS INITIAL.
    check ph_tab is not INITIAL.
    acronym = REDUCE string( INIT res = ``
                             FOR i = 1 UNTIL i > lines( ph_tab )
                             NEXT
                             res &&= to_upper( substring( val = ph_tab[ i ] off = 0 len = 1 ) )
                              ).

  ENDMETHOD.
ENDCLASS.
