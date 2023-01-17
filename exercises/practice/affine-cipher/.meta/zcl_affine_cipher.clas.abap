CLASS zcl_affine_cipher DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES: BEGIN OF key,
             a TYPE i,
             b TYPE i,
           END OF key.

    METHODS:
      encode IMPORTING phrase        TYPE string
                       key           TYPE key
             RETURNING VALUE(cipher) TYPE string
             RAISING   cx_parameter_invalid,
      decode IMPORTING cipher        TYPE string
                       key           TYPE key
             RETURNING VALUE(phrase) TYPE string
             RAISING   cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.
    TYPES: ty_char1 TYPE c LENGTH 1.
    CONSTANTS:
      max_len TYPE i VALUE 26.
    METHODS:
      is_coprime         IMPORTING VALUE(a)    TYPE i
                         RETURNING VALUE(flag) TYPE abap_bool,
      ret_mmi            IMPORTING VALUE(a)   TYPE i
                         RETURNING VALUE(mmi) TYPE i,
      ret_upper_nth_char IMPORTING str           TYPE string
                                   n             TYPE i
                         RETURNING VALUE(letter) TYPE ty_char1,
      ret_nth_letter     IMPORTING n             TYPE i
                         RETURNING VALUE(letter) TYPE ty_char1,
      ret_letter_index   IMPORTING letter       TYPE ty_char1
                         RETURNING VALUE(index) TYPE i.

ENDCLASS.



CLASS zcl_affine_cipher IMPLEMENTATION.
  METHOD encode.
    IF is_coprime( key-a ) = abap_false.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.
    DATA(str) = replace( val   = phrase
                         with  = ``
                         regex = '[\,\s\.]'
                         occ   = 0 ).
    cipher = REDUCE string(
               INIT result TYPE string
                    cur_letter = ''
               FOR i = 0 UNTIL i = strlen( str )
               NEXT cur_letter = ret_upper_nth_char( str = str
                                                       n = i )
                    result &&= |{
                      COND string(
                        WHEN i MOD 5 = 0 AND i > 0
                          THEN ` `
                          ELSE `` ) }{
                      to_lower(
                        COND string(
                          WHEN cur_letter CA sy-abcde
                            THEN ret_nth_letter(
                                   ( ( ( key-a * ret_letter_index( cur_letter ) ) + key-b ) MOD max_len ) )
                            ELSE cur_letter ) ) }| ).
  ENDMETHOD.

  METHOD ret_upper_nth_char.
    letter = to_upper( substring( val = str off = n len = 1 ) ).
  ENDMETHOD.

  METHOD ret_nth_letter.
    letter = substring( val = sy-abcde off = n len = 1 ).
  ENDMETHOD.

  METHOD ret_letter_index.
    index = find( val = sy-abcde sub = letter ).
  ENDMETHOD.

  METHOD decode.
    DATA(mmi) = ret_mmi( key-a ).
    IF mmi = 0.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    DATA(str) = condense( val = cipher from = ` ` to = `` ).
    phrase = REDUCE string(
               INIT result TYPE string
                    cur_letter = ''
               FOR i = 0 UNTIL i = strlen( str )
               NEXT cur_letter = ret_upper_nth_char( str = str
                                                       n = i )
                    result &&= |{
                      COND string(
                        WHEN cur_letter CA sy-abcde
                          THEN to_lower(
                                 ret_nth_letter(
                                   ( ( mmi * ( ret_letter_index( cur_letter ) - key-b ) MOD max_len ) ) ) )
                          ELSE cur_letter ) }| ).

  ENDMETHOD.

  METHOD is_coprime.
    DATA(m) = max_len.
    WHILE a <> 0 AND m <> 0.
      IF a = nmax( val1 = a val2 = m ).
        a = a MOD m.
      ELSE.
        m = m MOD a.
      ENDIF.
    ENDWHILE.
    IF nmax( val1 = a val2 = m ) = 1.
      flag = abap_true.
    ENDIF.
  ENDMETHOD.

  METHOD ret_mmi.
    DATA(i) = 0.
    DATA(x) = 0.
    WHILE i < max_len.
      x = ( ( a MOD max_len ) * ( i MOD max_len ) ) MOD max_len.
      IF x = 1.
        mmi = i.
        EXIT.
      ENDIF.
      i += 1.
    ENDWHILE.
  ENDMETHOD.

ENDCLASS.
