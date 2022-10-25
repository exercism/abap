CLASS zcl_etl DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES:
      BEGIN OF ty_legacy_data,
        number TYPE i,
        string TYPE string,
      END OF ty_legacy_data,
      BEGIN OF ty_new_data,
        letter TYPE c LENGTH 1,
        number TYPE i,
      END OF ty_new_data,
      tty_legacy_data TYPE SORTED TABLE OF ty_legacy_data WITH UNIQUE KEY number,
      tty_new_data    TYPE SORTED TABLE OF ty_new_data WITH UNIQUE KEY letter.

    METHODS transform IMPORTING legacy_data     TYPE tty_legacy_data
                      RETURNING VALUE(new_data) TYPE tty_new_data
                      RAISING   cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_etl IMPLEMENTATION.
  METHOD transform.
    TRY.
        new_data = VALUE tty_new_data(
                     FOR legacy IN legacy_data
                     FOR i = 0 UNTIL i = strlen( replace( val = legacy-string
                                                          sub = ','
                                                         with = ``
                                                          occ = 0 ) )
                       LET str = replace( val = legacy-string
                                          sub = ','
                                         with = ``
                                          occ = 0 )
                       IN ( letter = to_lower( substring( val = str
                                                          off = i
                                                          len = 1 ) )
                            number = legacy-number ) ).
      CATCH cx_root.
        RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
