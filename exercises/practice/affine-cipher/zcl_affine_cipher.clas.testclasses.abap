CLASS ltcl_crypto_square DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_affine_cipher.
    METHODS setup.
    METHODS:
      encode_yes                  FOR TESTING,
      encode_no                   FOR TESTING,
      encode_omg                  FOR TESTING,
      encode_o_m_g                FOR TESTING,
      encode_string               FOR TESTING,
      encode_sentence_with_number FOR TESTING,
      encode_sentence             FOR TESTING,
      encode_all_letters          FOR TESTING,
      encode_no_coprime           FOR TESTING,
      decode_exercism             FOR TESTING,
      decode_sentence             FOR TESTING,
      decode_sentence_with_number FOR TESTING,
      decode_all_letters          FOR TESTING,
      decode_multi_space          FOR TESTING,
      decode_no_coprime           FOR TESTING.
ENDCLASS.


CLASS ltcl_crypto_square IMPLEMENTATION.
  METHOD setup.
    cut = NEW zcl_affine_cipher( ).
  ENDMETHOD.

  METHOD encode_yes.
    cl_abap_unit_assert=>assert_equals(
      exp = `xbt`
      act = cut->encode(
              phrase = `yes`
              key    = VALUE #( a = 5 b = 7 ) ) ).
  ENDMETHOD.

  METHOD encode_no.
    cl_abap_unit_assert=>assert_equals(
      exp = `fu`
      act = cut->encode(
              phrase = `no`
              key    = VALUE #( a = 15 b = 18 ) ) ).
  ENDMETHOD.

  METHOD encode_omg.
    cl_abap_unit_assert=>assert_equals(
      exp = `lvz`
      act = cut->encode(
              phrase = `OMG`
              key    = VALUE #( a = 21 b = 3 ) ) ).
  ENDMETHOD.

  METHOD encode_o_m_g.
    cl_abap_unit_assert=>assert_equals(
      exp = `hjp`
      act = cut->encode(
              phrase = `O M G`
              key    = VALUE #( a = 25 b = 47 ) ) ).
  ENDMETHOD.

  METHOD encode_string.
    cl_abap_unit_assert=>assert_equals(
      exp = `rzcwa gnxzc dgt`
      act = cut->encode(
              phrase = `mindblowingly`
              key    = VALUE #( a = 11 b = 15 ) ) ).
  ENDMETHOD.

  METHOD encode_sentence_with_number.
    cl_abap_unit_assert=>assert_equals(
      exp = `jqgjc rw123 jqgjc rw`
      act = cut->encode(
              phrase = `Testing,1 2 3, testing.`
              key    = VALUE #( a = 3 b = 4 ) ) ).
  ENDMETHOD.

  METHOD encode_sentence.
    cl_abap_unit_assert=>assert_equals(
      exp = `iynia fdqfb ifje`
      act = cut->encode(
              phrase = `Truth is fiction.`
              key    = VALUE #( a = 5 b = 17 ) ) ).
  ENDMETHOD.

  METHOD encode_all_letters.
    DATA(exp) = `swxtj npvyk lruol iejdc blaxk swxmh qzglf`.
    DATA(phrase) = `The quick brown fox jumps over the lazy dog.`.
    cl_abap_unit_assert=>assert_equals(
      exp = exp
      act = cut->encode(
              phrase = phrase
              key    = VALUE #( a = 17 b = 33 ) ) ).
  ENDMETHOD.

  METHOD encode_no_coprime.
    TRY.
        cut->encode(
          phrase = `Test`
          key    = VALUE #( a = 6 b = 17 ) ).
        cl_abap_unit_assert=>fail( ).
      CATCH cx_parameter_invalid.
    ENDTRY.
  ENDMETHOD.

  METHOD decode_exercism.
    cl_abap_unit_assert=>assert_equals(
      exp = `exercism`
      act = cut->decode(
              cipher = `tytgn fjr`
              key    = VALUE #( a = 3 b = 7 ) ) ).
  ENDMETHOD.

  METHOD decode_sentence.
    DATA(cipher) = `qdwju nqcro muwhn odqun oppmd aunwd o`.
    cl_abap_unit_assert=>assert_equals(
      exp = `anobstacleisoftenasteppingstone`
      act = cut->decode(
              cipher = cipher
              key    = VALUE #( a = 19 b = 16 ) ) ).
  ENDMETHOD.

  METHOD decode_sentence_with_number.
    cl_abap_unit_assert=>assert_equals(
      exp = `testing123testing`
      act = cut->decode(
              cipher = `odpoz ub123 odpoz ub`
              key    = VALUE #( a = 25 b = 7 ) ) ).
  ENDMETHOD.

  METHOD decode_all_letters.
    DATA(cipher) = `swxtj npvyk lruol iejdc blaxk swxmh qzglf`.
    cl_abap_unit_assert=>assert_equals(
      exp = `thequickbrownfoxjumpsoverthelazydog`
      act = cut->decode(
              cipher = cipher
              key    = VALUE #( a = 17 b = 33 ) ) ).
  ENDMETHOD.

  METHOD decode_multi_space.
    DATA(cipher) = `vszzm    cly   yd cg    qdp`.
    cl_abap_unit_assert=>assert_equals(
      exp = `jollygreengiant`
      act = cut->decode(
              cipher = cipher
              key    = VALUE #( a = 15 b = 16 ) ) ).
  ENDMETHOD.

  METHOD decode_no_coprime.
    TRY.
        cut->decode(
          cipher = `Test`
          key    = VALUE #( a = 13 b = 5 ) ).
        cl_abap_unit_assert=>fail( ).
      CATCH cx_parameter_invalid.
    ENDTRY.
  ENDMETHOD.

ENDCLASS.
