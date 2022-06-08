CLASS ltcl_word_count DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT FINAL.

  PRIVATE SECTION.

    DATA cut TYPE REF TO zcl_word_count.
    METHODS setup.
    METHODS test_one_word FOR TESTING RAISING cx_static_check.
    METHODS test_three_words FOR TESTING RAISING cx_static_check.
    METHODS test_five_words_multiple FOR TESTING RAISING cx_static_check.
    METHODS test_three_words_comma FOR TESTING RAISING cx_static_check.
    METHODS test_three_words_linebreak FOR TESTING RAISING cx_static_check.
    METHODS test_special_character FOR TESTING RAISING cx_static_check.
    METHODS test_words_number_comma FOR TESTING RAISING cx_static_check.
    METHODS test_case_insensitive FOR TESTING RAISING cx_static_check.
    METHODS test_colon_apostrophe FOR TESTING RAISING cx_static_check.
    METHODS test_apostrophe FOR TESTING RAISING cx_static_check.
    METHODS test_comma_apostroph FOR TESTING RAISING cx_static_check.
    METHODS test_whitespaces FOR TESTING RAISING cx_static_check.
    METHODS test_comma_linebreaks FOR TESTING RAISING cx_static_check.


ENDCLASS.

CLASS ltcl_word_count IMPLEMENTATION.

  METHOD setup.
    cut = NEW zcl_word_count( ).
  ENDMETHOD.


  METHOD test_one_word.
    DATA(exp) = VALUE zcl_word_count=>return_table(
                ( word = 'word' count = 1 ) ).
    DATA(act) = cut->count_words( 'word' ).

    SORT exp BY word.
    SORT act BY word.
    cl_abap_unit_assert=>assert_equals(
        act = act
        exp = exp ).
  ENDMETHOD.

  METHOD test_three_words.
    DATA(exp) = VALUE zcl_word_count=>return_table(
                ( word = 'one' count = 1 )
                ( word = 'of' count = 1 )
                ( word = 'each' count = 1 ) ).
    DATA(act) = cut->count_words( 'one of each' ).

    SORT exp BY word.
    SORT act BY word.
    cl_abap_unit_assert=>assert_equals(
        act = act
        exp = exp ).
  ENDMETHOD.

  METHOD test_five_words_multiple.
    DATA(exp) = VALUE zcl_word_count=>return_table(
                ( word = 'one' count = 1 )
                ( word = 'fish' count = 4 )
                ( word = 'two' count = 1 )
                ( word = 'red' count = 1 )
                ( word = 'blue' count = 1 ) ).
    DATA(act) = cut->count_words( 'one fish two fish red fish blue fish' ).

    SORT exp BY word.
    SORT act BY word.
    cl_abap_unit_assert=>assert_equals(
        act = act
        exp = exp ).
  ENDMETHOD.

  METHOD test_three_words_comma.
    DATA(exp) = VALUE zcl_word_count=>return_table(
                ( word = 'one' count = 1 )
                ( word = 'three' count = 1 )
                ( word = 'two' count = 1 ) ).
    DATA(act) = cut->count_words( 'one,two,three' ).

    SORT exp BY word.
    SORT act BY word.
    cl_abap_unit_assert=>assert_equals(
        act = act
        exp = exp ).
  ENDMETHOD.

  METHOD test_three_words_linebreak.
    DATA(exp) = VALUE zcl_word_count=>return_table(
                ( word = 'one' count = 1 )
                ( word = 'three' count = 1 )
                ( word = 'two' count = 1 ) ).
    DATA(act) = cut->count_words( 'one,\ntwo,\nthree' ).

    SORT exp BY word.
    SORT act BY word.
    cl_abap_unit_assert=>assert_equals(
        act = act
        exp = exp ).
  ENDMETHOD.

  METHOD test_special_character.
    DATA(exp) = VALUE zcl_word_count=>return_table(
                ( word = 'car' count = 1 )
                ( word = 'carpet' count = 1 )
                ( word = 'as' count = 1 )
                ( word = 'java' count = 1 )
                ( word = 'javascript' count = 1 ) ).
    DATA(act) = cut->count_words( 'car: carpet as java: javascript!!&@$%^&' ).

    SORT exp BY word.
    SORT act BY word.
    cl_abap_unit_assert=>assert_equals(
        act = act
        exp = exp ).
  ENDMETHOD.

  METHOD test_words_number_comma.
    DATA(exp) = VALUE zcl_word_count=>return_table(
                ( word = 'testing' count = 2 )
                ( word = '1' count = 1 )
                ( word = '2' count = 1 ) ).
    DATA(act) = cut->count_words( 'testing, 1, 2 testing' ).

    SORT exp BY word.
    SORT act BY word.
    cl_abap_unit_assert=>assert_equals(
        act = act
        exp = exp ).
  ENDMETHOD.

  METHOD test_case_insensitive.
    DATA(exp) = VALUE zcl_word_count=>return_table(
                ( word = 'go' count = 3 )
                ( word = 'stop' count = 2 ) ).
    DATA(act) = cut->count_words( 'go Go GO Stop stop' ).

    SORT exp BY word.
    SORT act BY word.
    cl_abap_unit_assert=>assert_equals(
        act = act
        exp = exp ).
  ENDMETHOD.

  METHOD test_colon_apostrophe.
    DATA(exp) = VALUE zcl_word_count=>return_table(
                ( word = 'first' count = 1 )
                ( word = 'dont' count = 2 )
                ( word = 'laugh' count = 1 )
                ( word = 'then' count = 1 )
                ( word = 'cry' count = 1 ) ).
    DATA(act) = cut->count_words( `First: don't laugh. Then: don't cry.` ).

    SORT exp BY word.
    SORT act BY word.
    cl_abap_unit_assert=>assert_equals(
        act = act
        exp = exp ).
  ENDMETHOD.

  METHOD test_apostrophe.
    DATA(exp) = VALUE zcl_word_count=>return_table(
                ( word = 'joe' count = 1 )
                ( word = 'cant' count = 1 )
                ( word = 'tell' count = 1 )
                ( word = 'between' count = 1 )
                ( word = 'large' count = 2 )
                ( word = 'and' count = 1 ) ).
    DATA(act) = cut->count_words( `Joe can't tell between 'large' and large.` ).

    SORT exp BY word.
    SORT act BY word.
    cl_abap_unit_assert=>assert_equals(
        act = act
        exp = exp ).
  ENDMETHOD.

  METHOD test_comma_apostroph.
    DATA(exp) = VALUE zcl_word_count=>return_table(
                ( word = 'joe' count = 1 )
                ( word = 'cant' count = 1 )
                ( word = 'tell' count = 1 )
                ( word = 'between' count = 1 )
                ( word = 'app' count = 1 )
                ( word = 'apple' count = 1 )
                ( word = 'and' count = 1 )
                ( word = 'a' count = 1 ) ).
    DATA(act) = cut->count_words( `Joe can't tell between app, apple and a.'` ).

    SORT exp BY word.
    SORT act BY word.
    cl_abap_unit_assert=>assert_equals(
        act = act
        exp = exp ).
  ENDMETHOD.

  METHOD test_whitespaces.
    DATA(exp) = VALUE zcl_word_count=>return_table(
                ( word = 'multiple' count = 1 )
                ( word = 'whitespaces' count = 1 ) ).
    DATA(act) = cut->count_words( ` multiple   whitespaces` ).

    SORT exp BY word.
    SORT act BY word.
    cl_abap_unit_assert=>assert_equals(
        act = act
        exp = exp ).
  ENDMETHOD.

  METHOD test_comma_linebreaks.
    DATA(exp) = VALUE zcl_word_count=>return_table(
                ( word = 'one' count = 1 )
                ( word = 'three' count = 1 )
                ( word = 'two' count = 1 ) ).
    DATA(act) = cut->count_words( `,\n,one,\n ,two \n 'three'` ).

    SORT exp BY word.
    SORT act BY word.
    cl_abap_unit_assert=>assert_equals(
        act = act
        exp = exp ).
  ENDMETHOD.


ENDCLASS.
