*"* use this source file for your ABAP unit test classes
CLASS ltcl_acronym DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_acronym.

    METHODS setup.
    METHODS:
      basic_phrase FOR TESTING,
      lowercase_words FOR TESTING,
      punctuations FOR TESTING,
      all_caps FOR TESTING,
      punc_wo_space FOR TESTING,
      long_phrase FOR TESTING,
      consecutive_delimeters FOR TESTING,
      apostrophes FOR TESTING,
      underscore FOR TESTING,
      empty_string FOR TESTING.
ENDCLASS.


CLASS ltcl_acronym  IMPLEMENTATION.
  METHOD setup.
    cut = NEW zcl_acronym( ).
  ENDMETHOD.

  METHOD basic_phrase.
    cl_abap_unit_assert=>assert_equals(
       act = cut->parse( `Portable Network Graphics` )
       exp = `PNG` ).
  ENDMETHOD.

  METHOD lowercase_words.
    cl_abap_unit_assert=>assert_equals(
       act = cut->parse( `Ruby on Rails` )
       exp = `ROR` ).
  ENDMETHOD.

  METHOD all_caps.
    cl_abap_unit_assert=>assert_equals(
       act = cut->parse( `GNU Image Manipulation Program` )
       exp = `GIMP` ).
  ENDMETHOD.

  METHOD apostrophes.
    cl_abap_unit_assert=>assert_equals(
       act = cut->parse( `Halley's Comet` )
       exp = `HC` ).
  ENDMETHOD.

  METHOD consecutive_delimeters.
    cl_abap_unit_assert=>assert_equals(
       act = cut->parse( `Something - I made up from thin air` )
       exp = `SIMUFTA` ).
  ENDMETHOD.

  METHOD empty_string.
    cl_abap_unit_assert=>assert_equals(
       act = cut->parse( `` )
       exp = `` ).
  ENDMETHOD.

  METHOD long_phrase.
    cl_abap_unit_assert=>assert_equals(
       act = cut->parse( `Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me` )
       exp = `ROTFLSHTMDCOALM` ).
  ENDMETHOD.

  METHOD punctuations.
    cl_abap_unit_assert=>assert_equals(
       act = cut->parse( `First In, First Out` )
       exp = `FIFO` ).
  ENDMETHOD.

  METHOD punc_wo_space.
    cl_abap_unit_assert=>assert_equals(
       act = cut->parse( `Complementary metal-oxide semiconductor` )
       exp = `CMOS` ).
  ENDMETHOD.

  METHOD underscore.
    cl_abap_unit_assert=>assert_equals(
       act = cut->parse( `The Road _Not_ Taken` )
       exp = `TRNT` ).
  ENDMETHOD.

ENDCLASS.
