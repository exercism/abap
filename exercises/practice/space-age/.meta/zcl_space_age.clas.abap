CLASS zcl_space_age DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES age_in_years TYPE p LENGTH 3 DECIMALS 2.
    METHODS age
      IMPORTING
        planet        TYPE string
        seconds       TYPE i
      RETURNING
        VALUE(result) TYPE age_in_years
      RAISING
        cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.
    CONSTANTS earth_year_seconds TYPE f VALUE '31557600'.
    METHODS orbital_period
      IMPORTING
        planet        TYPE string
      RETURNING
        VALUE(result) TYPE f
      RAISING
        cx_parameter_invalid.

ENDCLASS.


CLASS zcl_space_age IMPLEMENTATION.
  METHOD age.
    result = seconds / earth_year_seconds / orbital_period( planet ).
  ENDMETHOD.

  METHOD orbital_period.
    CASE planet.
      WHEN 'Earth'.
        result = '1.0'.
      WHEN 'Mercury'.
        result = '0.2408467'.
      WHEN 'Venus'.
        result = '0.61519726'.
      WHEN 'Mars'.
        result = '1.8808158'.
      WHEN 'Jupiter'.
        result = '11.862615'.
      WHEN 'Saturn'.
        result = '29.447498'.
      WHEN 'Uranus'.
        result = '84.016846'.
      WHEN 'Neptune'.
        result = '164.79132'.
      WHEN OTHERS.
        RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDCASE.
  ENDMETHOD.


ENDCLASS.
