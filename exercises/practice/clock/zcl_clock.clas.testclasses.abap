CLASS ltcl_clock DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT FINAL.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_clock.

    METHODS:
      on_the_hour FOR TESTING,
      past_the_hour FOR TESTING,
      adding_a_few_minutes FOR TESTING,
      adding_zero_minutes FOR TESTING,
      adding_over_an_hour FOR TESTING,
      adding_more_than_two_hours_w_c FOR TESTING,
      adding_more_than_two_days FOR TESTING,
      wrap_around_at_midnight FOR TESTING,
      subtract_minutes FOR TESTING,
      subtract_more_than_two_hours FOR TESTING,
      subtract_more_than_two_hours_w FOR TESTING,
      subtract_more_than_two_days FOR TESTING,
      wrap_around_backwards FOR TESTING,
      wrap_around_day FOR TESTING,
      wrap_around_day_backwards FOR TESTING,
      equivalent_clocks FOR TESTING,
      inequivalent_clocks FOR TESTING,
      equivalent_clocks_1 FOR TESTING,
      equivalent_clocks_2 FOR TESTING,
      equivalent_clocks_3 FOR TESTING,
      equivalent_clocks_4 FOR TESTING,
      equivalent_clocks_5 FOR TESTING,
      equivalent_clocks_6 FOR TESTING,
      hours_rollover FOR TESTING,
      minutes_rollover FOR TESTING,
      hours_and_minutes_rollover FOR TESTING,
      negative_hours_rollover FOR TESTING,
      negative_minutes_rollover FOR TESTING,
      negative_hours_and_minutes FOR TESTING.

ENDCLASS.

CLASS ltcl_clock IMPLEMENTATION.

  METHOD on_the_hour.
    cut = NEW zcl_clock( 8 ).

    cl_abap_unit_assert=>assert_equals(
        exp = '08:00'
        act = cut->get( ) ).
  ENDMETHOD.

  METHOD past_the_hour.
    cut = NEW zcl_clock( hours   = 11
                         minutes = 9 ).

    cl_abap_unit_assert=>assert_equals(
        exp = '11:09'
        act = cut->get( ) ).
  ENDMETHOD.

  METHOD adding_a_few_minutes.
    cut = NEW zcl_clock( 10 ).

    cut->add( 3 ).

    cl_abap_unit_assert=>assert_equals(
        exp = '10:03'
        act = cut->get( ) ).
  ENDMETHOD.

  METHOD adding_zero_minutes.
    cut = NEW zcl_clock( hours   = 6
                         minutes = 41 ).

    cut->add( 0 ).

    cl_abap_unit_assert=>assert_equals(
        exp = '06:41'
        act = cut->get( ) ).
  ENDMETHOD.

  METHOD adding_over_an_hour.
    cut = NEW zcl_clock( 10 ).

    cut->add( 61 ).

    cl_abap_unit_assert=>assert_equals(
        exp = '11:01'
        act = cut->get( ) ).
  ENDMETHOD.

  METHOD adding_more_than_two_hours_w_c.
    cut = NEW zcl_clock( hours   = 0
                         minutes = 45 ).

    cut->add( 160 ).

    cl_abap_unit_assert=>assert_equals(
        exp = '03:25'
        act = cut->get( ) ).
  ENDMETHOD.

  METHOD adding_more_than_two_days.
    cut = NEW zcl_clock( hours   = 1
                         minutes = 1 ).

    cut->add( 3500 ).

    cl_abap_unit_assert=>assert_equals(
        exp = '11:21'
        act = cut->get( ) ).
  ENDMETHOD.

  METHOD wrap_around_at_midnight.
    cut = NEW zcl_clock( hours   = 23
                         minutes = 30 ).

    cut->add( 60 ).

    cl_abap_unit_assert=>assert_equals(
        exp = '00:30'
        act = cut->get( ) ).
  ENDMETHOD.

  METHOD subtract_minutes.
    cut = NEW zcl_clock( 10 ).

    cut->sub( 90 ).

    cl_abap_unit_assert=>assert_equals(
        exp = '08:30'
        act = cut->get( ) ).
  ENDMETHOD.

  METHOD subtract_more_than_two_hours.
    cut = NEW zcl_clock( hours   = 6
                         minutes = 15 ).

    cut->sub( 160 ).

    cl_abap_unit_assert=>assert_equals(
        exp = '03:35'
        act = cut->get( ) ).
  ENDMETHOD.

  METHOD subtract_more_than_two_hours_w.
    cut = NEW zcl_clock( hours   = 6
                         minutes = 15 ).

    cut->add( -160 ).

    cl_abap_unit_assert=>assert_equals(
        exp = '03:35'
        act = cut->get( ) ).

  ENDMETHOD.

  METHOD subtract_more_than_two_days.
    cut = NEW zcl_clock( hours   = 2
                         minutes = 20 ).

    cut->sub( 3000 ).

    cl_abap_unit_assert=>assert_equals(
        exp = '00:20'
        act = cut->get( ) ).
  ENDMETHOD.

  METHOD wrap_around_backwards.
    cut = NEW zcl_clock( hours   = 0
                         minutes = 30 ).

    cut->sub( 60 ).

    cl_abap_unit_assert=>assert_equals(
        exp = '23:30'
        act = cut->get( ) ).
  ENDMETHOD.

  METHOD wrap_around_day.
    cut = NEW zcl_clock( hours   = 5
                         minutes = 32 ).

    cut->add( 25 * 60 ).

    cl_abap_unit_assert=>assert_equals(
        exp = '06:32'
        act = cut->get( ) ).

  ENDMETHOD.

  METHOD wrap_around_day_backwards.
    cut = NEW zcl_clock( hours   = 5
                         minutes = 32 ).

    cut->sub( 25 * 60 ).

    cl_abap_unit_assert=>assert_equals(
        exp = '04:32'
        act = cut->get( ) ).
  ENDMETHOD.

  METHOD equivalent_clocks.
    cl_abap_unit_assert=>assert_equals(
        exp = NEW zcl_clock( hours   = 15
                             minutes = 37 )->get( )
        act = NEW zcl_clock( hours   = 15
                             minutes = 37 )->get( ) ).
  ENDMETHOD.

  METHOD inequivalent_clocks.
    cl_abap_unit_assert=>assert_differs(
        exp = NEW zcl_clock( hours   = 1
                             minutes = 1 )->get( )
        act = NEW zcl_clock( hours   = 18
                             minutes = 32 )->get( ) ).
  ENDMETHOD.

  METHOD equivalent_clocks_1.
    cl_abap_unit_assert=>assert_equals(
        exp = NEW zcl_clock( hours   = 3
                             minutes = 11 )->get( )
        act = NEW zcl_clock( hours   = 99
                             minutes = 11 )->get( ) ).
  ENDMETHOD.

  METHOD equivalent_clocks_2.
    cl_abap_unit_assert=>assert_equals(
        exp = NEW zcl_clock( hours   = 22
                             minutes = 40 )->get( )
        act = NEW zcl_clock( hours   = -2
                             minutes = 40 )->get( ) ).
  ENDMETHOD.

  METHOD equivalent_clocks_3.
    cl_abap_unit_assert=>assert_equals(
        exp = NEW zcl_clock( hours   = 17
                             minutes = 3 )->get( )
        act = NEW zcl_clock( hours   = -31
                             minutes = 3 )->get( ) ).
  ENDMETHOD.

  METHOD equivalent_clocks_4.
    cl_abap_unit_assert=>assert_equals(
        exp = NEW zcl_clock( hours   = 2
                             minutes = 2 )->get( )
        act = NEW zcl_clock( hours   = 2
                             minutes = 4322 )->get( ) ).
  ENDMETHOD.

  METHOD equivalent_clocks_5.
    cl_abap_unit_assert=>assert_equals(
        exp = NEW zcl_clock( hours   = 2
                             minutes = 40 )->get( )
        act = NEW zcl_clock( hours   = 3
                             minutes = -20 )->get( ) ).
  ENDMETHOD.

  METHOD equivalent_clocks_6.
    cl_abap_unit_assert=>assert_equals(
        exp = NEW zcl_clock( hours   = 7
                             minutes = 32 )->get( )
        act = NEW zcl_clock( hours   = -12
                             minutes = -268 )->get( ) ).
  ENDMETHOD.

  METHOD hours_rollover.
    cl_abap_unit_assert=>assert_equals(
        exp = '04:00'
        act = NEW zcl_clock( 100 )->get( ) ).
  ENDMETHOD.

  METHOD minutes_rollover.
    cl_abap_unit_assert=>assert_equals(
        exp = '04:43'
        act = NEW zcl_clock( hours   = 0
                             minutes = 1723 )->get( ) ).
  ENDMETHOD.

  METHOD hours_and_minutes_rollover.
    cl_abap_unit_assert=>assert_equals(
        exp = '00:00'
        act = NEW zcl_clock( hours   = 72
                             minutes = 8640 )->get( ) ).
  ENDMETHOD.

  METHOD negative_hours_rollover.
    cl_abap_unit_assert=>assert_equals(
        exp = '05:00'
        act = NEW zcl_clock( -91 )->get( ) ).
  ENDMETHOD.

  METHOD negative_minutes_rollover.
    cl_abap_unit_assert=>assert_equals(
        exp = '16:40'
        act = NEW zcl_clock( hours   = 1
                             minutes = -4820 )->get( ) ).
  ENDMETHOD.

  METHOD negative_hours_and_minutes.
    cl_abap_unit_assert=>assert_equals(
        exp = '22:10'
        act = NEW zcl_clock( hours   = -121
                             minutes = -5810 )->get( ) ).
  ENDMETHOD.
ENDCLASS.
