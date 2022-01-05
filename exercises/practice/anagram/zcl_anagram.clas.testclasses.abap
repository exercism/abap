CLASS ltcl_anagram DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT FINAL.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_anagram.
    METHODS setup.
    METHODS test_test FOR TESTING RAISING cx_static_check.
    METHODS test_no_matches FOR TESTING RAISING cx_static_check.
    METHODS test_two_anagrams FOR TESTING RAISING cx_static_check.
    METHODS test_two_anagrams2 FOR TESTING RAISING cx_static_check.
    METHODS test_anagram_subset FOR TESTING RAISING cx_static_check.
    METHODS test_one_anagram FOR TESTING RAISING cx_static_check.
    METHODS test_three_anagrams FOR TESTING RAISING cx_static_check.
    METHODS test_multiple_case FOR TESTING RAISING cx_static_check.
    METHODS test_identical_checksum FOR TESTING RAISING cx_static_check.
    METHODS test_case_insensitive FOR TESTING RAISING cx_static_check.
    METHODS test_case_insensitive2 FOR TESTING RAISING cx_static_check.
    METHODS test_case_insensitive3 FOR TESTING RAISING cx_static_check.
    METHODS test_original_word FOR TESTING RAISING cx_static_check.
    METHODS test_letters_once FOR TESTING RAISING cx_static_check.
    METHODS test_case_insensitive_original FOR TESTING RAISING cx_static_check.
    METHODS test_other_than_themselves FOR TESTING RAISING cx_static_check.

ENDCLASS.

CLASS ltcl_anagram IMPLEMENTATION.

  METHOD setup.
    cut = NEW zcl_anagram( ).
  ENDMETHOD.

  METHOD test_test.
    DATA(candidates) = VALUE string_table( ( |tset| ) ( |sett| ) ( |tesi| ) ( |tesit| ) ).
    DATA(exp_result) = VALUE string_table( ( |tset| ) ( |sett| ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->anagram( input = 'test' candidates = candidates )
      exp = exp_result ).
  ENDMETHOD.

  METHOD test_no_matches.
    DATA(candidates) = VALUE string_table( ( |hello| ) ( |world| ) ( |zombies| ) ( |pants| ) ).
    DATA(exp_result) = VALUE string_table( ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->anagram( input = 'diaper' candidates = candidates )
      exp = exp_result ).
  ENDMETHOD.

  METHOD test_two_anagrams.
    DATA(candidates) = VALUE string_table( ( |stream| ) ( |pigeon| ) ( |maters| ) ).
    DATA(exp_result) = VALUE string_table( ( |stream| ) ( |maters| ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->anagram( input = 'master' candidates = candidates )
      exp = exp_result ).
  ENDMETHOD.

  METHOD test_two_anagrams2.
    DATA(candidates) = VALUE string_table( ( |lemons| ) ( |cherry| ) ( |melons| ) ).
    DATA(exp_result) = VALUE string_table( ( |lemons| ) ( |melons| ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->anagram( input = 'solemn' candidates = candidates )
      exp = exp_result ).
  ENDMETHOD.

  METHOD test_anagram_subset.
    DATA(candidates) = VALUE string_table( ( |dog| ) ( |goody| ) ).
    DATA(exp_result) = VALUE string_table( ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->anagram( input = 'good' candidates = candidates )
      exp = exp_result ).
  ENDMETHOD.

  METHOD test_one_anagram.
    DATA(candidates) = VALUE string_table( ( |enlists| ) ( |google| ) ( |inlets| ) ( |banana| ) ).
    DATA(exp_result) = VALUE string_table( ( |inlets| ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->anagram( input = 'listen' candidates = candidates )
      exp = exp_result ).
  ENDMETHOD.

  METHOD test_three_anagrams.
    DATA(candidates) = VALUE string_table( ( |gallery| )
                                           ( |ballerina| )
                                           ( |regally| )
                                           ( |clergy| )
                                           ( |largely| )
                                           ( |leading| ) ).
    DATA(exp_result) = VALUE string_table( ( |gallery| ) ( |regally| ) ( |largely| ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->anagram( input = 'allergy' candidates = candidates )
      exp = exp_result ).
  ENDMETHOD.

  METHOD test_multiple_case.
    DATA(candidates) = VALUE string_table( ( |Eons| ) ( |ONES| ) ).
    DATA(exp_result) = VALUE string_table( ( |Eons| ) ( |ONES| ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->anagram( input = 'nose' candidates = candidates )
      exp = exp_result ).
  ENDMETHOD.

  METHOD test_identical_checksum.
    DATA(candidates) = VALUE string_table( ( |last| ) ).
    DATA(exp_result) = VALUE string_table( ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->anagram( input = 'mass' candidates = candidates )
      exp = exp_result ).
  ENDMETHOD.

  METHOD test_case_insensitive.
    DATA(candidates) = VALUE string_table( ( |cashregister| ) ( |Carthorse| ) ( |radishes| ) ).
    DATA(exp_result) = VALUE string_table( ( |Carthorse| ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->anagram( input = 'Orchestra' candidates = candidates )
      exp = exp_result ).
  ENDMETHOD.

  METHOD test_case_insensitive2.
    DATA(candidates) = VALUE string_table( ( |cashregister| ) ( |carthorse| ) ( |radishes| ) ).
    DATA(exp_result) = VALUE string_table( ( |carthorse| ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->anagram( input = 'Orchestra' candidates = candidates )
      exp = exp_result ).
  ENDMETHOD.

  METHOD test_case_insensitive3.
    DATA(candidates) = VALUE string_table( ( |cashregister| ) ( |Carthorse| ) ( |radishes| ) ).
    DATA(exp_result) = VALUE string_table( ( |Carthorse| ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->anagram( input = 'orchestra' candidates = candidates )
      exp = exp_result ).
  ENDMETHOD.

  METHOD test_original_word.
    DATA(candidates) = VALUE string_table( ( |go Go GO| ) ).
    DATA(exp_result) = VALUE string_table( ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->anagram( input = 'go' candidates = candidates )
      exp = exp_result ).
  ENDMETHOD.

  METHOD test_letters_once.
    DATA(candidates) = VALUE string_table( ( |patter| ) ).
    DATA(exp_result) = VALUE string_table( ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->anagram( input = 'tapper' candidates = candidates )
      exp = exp_result ).
  ENDMETHOD.

  METHOD test_case_insensitive_original.
    DATA(candidates) = VALUE string_table( ( |BANANA| ) ( |Banana| ) ( |banana| ) ).
    DATA(exp_result) = VALUE string_table( ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->anagram( input = 'BANANA' candidates = candidates )
      exp = exp_result ).
  ENDMETHOD.

  METHOD test_other_than_themselves.
    DATA(candidates) = VALUE string_table( ( |Listen| ) ( |Silent| ) ( |LISTEN| ) ).
    DATA(exp_result) = VALUE string_table( ( |Silent| ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->anagram( input = 'LISTEN' candidates = candidates )
      exp = exp_result ).
  ENDMETHOD.

ENDCLASS.