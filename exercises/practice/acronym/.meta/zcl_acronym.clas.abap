CLASS zcl_acronym DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS parse IMPORTING phrase         TYPE string
                  RETURNING VALUE(acronym) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_acronym IMPLEMENTATION.
  METHOD parse.
    DATA(str) = phrase.
    REPLACE ALL OCCURRENCES OF REGEX '-' IN str WITH ` `.
    REPLACE ALL OCCURRENCES OF REGEX '['',_,]' IN str WITH ``.
    SPLIT str AT space INTO TABLE DATA(ph_tab).
    DELETE ph_tab WHERE table_line IS INITIAL.
    IF ph_tab IS INITIAL.
      RETURN.
    ENDIF.
    LOOP AT ph_tab INTO DATA(phr).
      acronym &&= to_upper( substring( val = phr off = 0 len = 1 ) ).
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
