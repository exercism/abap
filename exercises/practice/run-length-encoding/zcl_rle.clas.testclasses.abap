CLASS ltc_encode DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_rle.

    METHODS setup.

    METHODS empty_string FOR TESTING RAISING cx_static_check.
    METHODS no_repeat    FOR TESTING RAISING cx_static_check.
    METHODS no_singles   FOR TESTING RAISING cx_static_check.
    METHODS mixed_singles_and_repeats FOR TESTING RAISING cx_static_check.
    METHODS mixed_and_spaces FOR TESTING RAISING cx_static_check.
    METHODS lowercase        FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltc_encode IMPLEMENTATION.

  METHOD setup.
    cut = NEW zcl_rle( ).
  ENDMETHOD.

  METHOD empty_string.
    cl_abap_unit_assert=>assert_equals( act = cut->encode( `` )
                                        exp = `` ).
  ENDMETHOD.

  METHOD no_repeat.
    cl_abap_unit_assert=>assert_equals( act = cut->encode( `XYZ` )
                                        exp = `XYZ` ).
  ENDMETHOD.

  METHOD no_singles.
    cl_abap_unit_assert=>assert_equals( act = cut->encode( `AABBBCCCC` )
                                        exp = `2A3B4C` ).
  ENDMETHOD.

  METHOD mixed_singles_and_repeats.
    cl_abap_unit_assert=>assert_equals( act = cut->encode( `WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB` )
                                        exp = `12WB12W3B24WB` ).
  ENDMETHOD.

  METHOD mixed_and_spaces.
    cl_abap_unit_assert=>assert_equals( act = cut->encode( `  hsqq qww  ` )
                                        exp = `2 hs2q q2w2 ` ).
  ENDMETHOD.

  METHOD lowercase.
    cl_abap_unit_assert=>assert_equals( act = cut->encode( `aabbbcccc` )
                                        exp = `2a3b4c` ).
  ENDMETHOD.

ENDCLASS.


CLASS ltc_decode DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_rle.

    METHODS setup.

    METHODS empty_string FOR TESTING RAISING cx_static_check.
    METHODS no_repeat    FOR TESTING RAISING cx_static_check.
    METHODS no_singles   FOR TESTING RAISING cx_static_check.
    METHODS mixed_singles_and_repeats FOR TESTING RAISING cx_static_check.
    METHODS mixed_and_spaces FOR TESTING RAISING cx_static_check.
    METHODS lowercase        FOR TESTING RAISING cx_static_check.
    METHODS encode_and_decode FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltc_decode IMPLEMENTATION.

  METHOD setup.
    cut = NEW zcl_rle( ).
  ENDMETHOD.

  METHOD empty_string.
    cl_abap_unit_assert=>assert_equals( act = cut->decode( `` )
                                        exp = `` ).
  ENDMETHOD.

  METHOD no_repeat.
    cl_abap_unit_assert=>assert_equals( act = cut->decode( `XYZ` )
                                        exp = `XYZ` ).
  ENDMETHOD.

  METHOD no_singles.
    cl_abap_unit_assert=>assert_equals( act = cut->decode( `2A3B4C` )
                                        exp = `AABBBCCCC` ).
  ENDMETHOD.

  METHOD mixed_singles_and_repeats.
    cl_abap_unit_assert=>assert_equals( act = cut->decode( `12WB12W3B24WB` )
                                        exp = `WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB` ).
  ENDMETHOD.

  METHOD mixed_and_spaces.
    cl_abap_unit_assert=>assert_equals( act = cut->decode( `2 hs2q q2w2 ` )
                                        exp = `  hsqq qww  ` ).
  ENDMETHOD.

  METHOD lowercase.
    cl_abap_unit_assert=>assert_equals( act = cut->decode( `2a3b4c` )
                                        exp = `aabbbcccc` ).
  ENDMETHOD.

  METHOD encode_and_decode.
    cl_abap_unit_assert=>assert_equals( act = cut->decode( cut->encode( `zzz ZZ  zZ` ) )
                                        exp = `zzz ZZ  zZ` ).
  ENDMETHOD.

ENDCLASS.