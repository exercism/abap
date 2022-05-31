CLASS ltcl_test DEFINITION FOR TESTING DURATION SHORT RISK LEVEL HARMLESS FINAL.

  PRIVATE SECTION.
    DATA mo_cut TYPE REF TO zcl_atbash_cipher.

    METHODS setup.
    METHODS encode1 FOR TESTING RAISING cx_static_check.
    METHODS encode2 FOR TESTING RAISING cx_static_check.
    METHODS encode3 FOR TESTING RAISING cx_static_check.
    METHODS encode4 FOR TESTING RAISING cx_static_check.
    METHODS encode5 FOR TESTING RAISING cx_static_check.
    METHODS encode6 FOR TESTING RAISING cx_static_check.
    METHODS encode7 FOR TESTING RAISING cx_static_check.
    METHODS encode8 FOR TESTING RAISING cx_static_check.

    METHODS decode1 FOR TESTING RAISING cx_static_check.
    METHODS decode2 FOR TESTING RAISING cx_static_check.
    METHODS decode3 FOR TESTING RAISING cx_static_check.
    METHODS decode4 FOR TESTING RAISING cx_static_check.
    METHODS decode5 FOR TESTING RAISING cx_static_check.
    METHODS decode6 FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltcl_test IMPLEMENTATION.

  METHOD setup.
    mo_cut = NEW #( ).
  ENDMETHOD.

  METHOD encode1.
    cl_abap_unit_assert=>assert_equals(
      act = mo_cut->encode( 'yes' )
      exp = 'bvh' ).
  ENDMETHOD.

  METHOD encode2.
    cl_abap_unit_assert=>assert_equals(
      act = mo_cut->encode( 'no' )
      exp = 'ml' ).
  ENDMETHOD.

  METHOD encode3.
    cl_abap_unit_assert=>assert_equals(
      act = mo_cut->encode( 'OMG' )
      exp = 'lnt' ).
  ENDMETHOD.

  METHOD encode4.
    cl_abap_unit_assert=>assert_equals(
      act = mo_cut->encode( 'O M G' )
      exp = 'lnt' ).
  ENDMETHOD.

  METHOD encode5.
    cl_abap_unit_assert=>assert_equals(
      act = mo_cut->encode( 'mindblowingly' )
      exp = 'nrmwy oldrm tob' ).
  ENDMETHOD.

  METHOD encode6.
    cl_abap_unit_assert=>assert_equals(
      act = mo_cut->encode( 'Testing,1 2 3, testing.' )
      exp = 'gvhgr mt123 gvhgr mt' ).
  ENDMETHOD.

  METHOD encode7.
    cl_abap_unit_assert=>assert_equals(
      act = mo_cut->encode( 'Truth is fiction.' )
      exp = 'gifgs rhurx grlm' ).
  ENDMETHOD.

  METHOD encode8.
    cl_abap_unit_assert=>assert_equals(
      act = mo_cut->encode( 'The quick brown fox jumps over the lazy dog.' )
      exp = 'gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt' ).
  ENDMETHOD.

  METHOD decode1.
    cl_abap_unit_assert=>assert_equals(
      act = mo_cut->decode( 'vcvix rhn' )
      exp = 'exercism' ).
  ENDMETHOD.

  METHOD decode2.
    cl_abap_unit_assert=>assert_equals(
      act = mo_cut->decode( 'zmlyh gzxov rhlug vmzhg vkkrm thglm v' )
      exp = 'anobstacleisoftenasteppingstone' ).
  ENDMETHOD.

  METHOD decode3.
    cl_abap_unit_assert=>assert_equals(
      act = mo_cut->decode( 'gvhgr mt123 gvhgr mt' )
      exp = 'testing123testing' ).
  ENDMETHOD.

  METHOD decode4.
    cl_abap_unit_assert=>assert_equals(
      act = mo_cut->decode( 'gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt' )
      exp = 'thequickbrownfoxjumpsoverthelazydog' ).
  ENDMETHOD.

  METHOD decode5.
    cl_abap_unit_assert=>assert_equals(
      act = mo_cut->decode( 'vc vix    r hn' )
      exp = 'exercism' ).
  ENDMETHOD.

  METHOD decode6.
    cl_abap_unit_assert=>assert_equals(
      act = mo_cut->decode( 'zmlyhgzxovrhlugvmzhgvkkrmthglmv' )
      exp = 'anobstacleisoftenasteppingstone' ).
  ENDMETHOD.
ENDCLASS.
