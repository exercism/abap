*"* use this source file for your ABAP unit test classes
class ltcl_acronym definition final for testing
  duration short
  risk level harmless.

  private section.
      DATA cut TYPE REF TO zcl_acronym.

    METHODS setup.
    methods:
      basic_phrase for testing,
      lowercase_words for testing,
      punctuations for testing,
      all_caps for testing,
      punc_wo_space for testing,
      long_phrase for testing,
      consecutive_delimeters for testing ,
      apostrophes for testing,
      underscore for testing,
      empty_string for testing.
endclass.


class ltcl_acronym  implementation.
   METHOD setup.
   cut = new zcl_acronym( ).
   ENDMETHOD.
  method basic_phrase.

   cl_abap_unit_assert=>assert_equals(
      act = cut->parse( `Portable Network Graphics`)
      exp = `PNG` ).
  endmethod.
  method lowercase_words.

   cl_abap_unit_assert=>assert_equals(
      act = cut->parse( `Ruby on Rails`)
      exp = `ROR` ).
  endmethod.

  method all_caps.
   cl_abap_unit_assert=>assert_equals(
      act = cut->parse( `GNU Image Manipulation Program`)
      exp = `GIMP` ).
  endmethod.

  method apostrophes.
   cl_abap_unit_assert=>assert_equals(
      act = cut->parse( `Halley's Comet`)
      exp = `HC` ).
  endmethod.

  method consecutive_delimeters.
   cl_abap_unit_assert=>assert_equals(
      act = cut->parse( `Something - I made up from thin air`)
      exp = `SIMUFTA` ).
  endmethod.

  method empty_string.
   cl_abap_unit_assert=>assert_equals(
      act = cut->parse( ``)
      exp = `` ).
  endmethod.

  method long_phrase.
   cl_abap_unit_assert=>assert_equals(
      act = cut->parse( `Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me`)
      exp = `ROTFLSHTMDCOALM` ).
  endmethod.

  method punctuations.
   cl_abap_unit_assert=>assert_equals(
      act = cut->parse( `First In, First Out`)
      exp = `FIFO` ).
  endmethod.

  method punc_wo_space.
   cl_abap_unit_assert=>assert_equals(
      act = cut->parse( `Complementary metal-oxide semiconductor`)
      exp = `CMOS` ).
  endmethod.

  method underscore.
   cl_abap_unit_assert=>assert_equals(
      act = cut->parse( `The Road _Not_ Taken`)
      exp = `TRNT` ).
  endmethod.

endclass.
