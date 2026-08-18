CLASS ltcl_relative_distance DEFINITION FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_relative_distance.
    METHODS setup.
    METHODS test_direct_parent_child FOR TESTING RAISING cx_static_check.
    METHODS test_sibling_relationship FOR TESTING RAISING cx_static_check.
    METHODS test_two_degrees_grandchild FOR TESTING RAISING cx_static_check.
    METHODS test_unrelated_individuals FOR TESTING RAISING cx_static_check.
    METHODS test_complex_graph_cousins FOR TESTING RAISING cx_static_check.
    METHODS test_complex_graph_no_shortcut FOR TESTING RAISING cx_static_check.
    METHODS test_complex_with_shortcuts FOR TESTING RAISING cx_static_check.

ENDCLASS.


CLASS ltcl_relative_distance IMPLEMENTATION.

  METHOD setup.
    cut = NEW zcl_relative_distance( ).
  ENDMETHOD.

  METHOD test_direct_parent_child.
    DATA(family_tree) = VALUE zcl_relative_distance=>ty_family_tree(
      ( parent = 'Vera' children = VALUE #( ( |Tomoko| ) ) )
      ( parent = 'Tomoko' children = VALUE #( ( |Aditi| ) ) ) ).

    cl_abap_unit_assert=>assert_equals(
      act = cut->degree_of_separation(
        family_tree = family_tree
        person_a    = 'Vera'
        person_b    = 'Tomoko' )
      exp = 1 ).
  ENDMETHOD.

  METHOD test_sibling_relationship.
    DATA(family_tree) = VALUE zcl_relative_distance=>ty_family_tree(
      ( parent = 'Dalia' children = VALUE #( ( |Olga| ) ( |Yassin| ) ) ) ).

    cl_abap_unit_assert=>assert_equals(
      act = cut->degree_of_separation(
        family_tree = family_tree
        person_a    = 'Olga'
        person_b    = 'Yassin' )
      exp = 1 ).
  ENDMETHOD.

  METHOD test_two_degrees_grandchild.
    DATA(family_tree) = VALUE zcl_relative_distance=>ty_family_tree(
      ( parent = 'Khadija' children = VALUE #( ( |Mateo| ) ) )
      ( parent = 'Mateo' children = VALUE #( ( |Rami| ) ) ) ).

    cl_abap_unit_assert=>assert_equals(
      act = cut->degree_of_separation(
        family_tree = family_tree
        person_a    = 'Khadija'
        person_b    = 'Rami' )
      exp = 2 ).
  ENDMETHOD.

  METHOD test_unrelated_individuals.
    DATA(family_tree) = VALUE zcl_relative_distance=>ty_family_tree(
      ( parent = 'Priya' children = VALUE #( ( |Rami| ) ) )
      ( parent = 'Kaito' children = VALUE #( ( |Elif| ) ) ) ).

    cl_abap_unit_assert=>assert_equals(
      act = cut->degree_of_separation(
        family_tree = family_tree
        person_a    = 'Priya'
        person_b    = 'Kaito' )
      exp = -1 ).
  ENDMETHOD.

  METHOD test_complex_graph_cousins.
    DATA(family_tree) = VALUE zcl_relative_distance=>ty_family_tree(
      ( parent = 'Aiko' children = VALUE #( ( |Bao| ) ( |Carlos| ) ) )
      ( parent = 'Bao' children = VALUE #( ( |Dalia| ) ( |Elias| ) ) )
      ( parent = 'Carlos' children = VALUE #( ( |Fatima| ) ( |Gustavo| ) ) )
      ( parent = 'Dalia' children = VALUE #( ( |Hassan| ) ( |Isla| ) ) )
      ( parent = 'Elias' children = VALUE #( ( |Javier| ) ) )
      ( parent = 'Fatima' children = VALUE #( ( |Khadija| ) ( |Liam| ) ) )
      ( parent = 'Gustavo' children = VALUE #( ( |Mina| ) ) )
      ( parent = 'Hassan' children = VALUE #( ( |Noah| ) ( |Olga| ) ) )
      ( parent = 'Isla' children = VALUE #( ( |Pedro| ) ) )
      ( parent = 'Javier' children = VALUE #( ( |Quynh| ) ( |Ravi| ) ) )
      ( parent = 'Khadija' children = VALUE #( ( |Sofia| ) ) )
      ( parent = 'Liam' children = VALUE #( ( |Tariq| ) ( |Uma| ) ) )
      ( parent = 'Mina' children = VALUE #( ( |Viktor| ) ( |Wang| ) ) )
      ( parent = 'Noah' children = VALUE #( ( |Xiomara| ) ) )
      ( parent = 'Olga' children = VALUE #( ( |Yuki| ) ) )
      ( parent = 'Pedro' children = VALUE #( ( |Zane| ) ( |Aditi| ) ) )
      ( parent = 'Quynh' children = VALUE #( ( |Boris| ) ) )
      ( parent = 'Ravi' children = VALUE #( ( |Celine| ) ) )
      ( parent = 'Sofia' children = VALUE #( ( |Diego| ) ( |Elif| ) ) )
      ( parent = 'Tariq' children = VALUE #( ( |Farah| ) ) )
      ( parent = 'Uma' children = VALUE #( ( |Giorgio| ) ) )
      ( parent = 'Viktor' children = VALUE #( ( |Hana| ) ( |Ian| ) ) )
      ( parent = 'Wang' children = VALUE #( ( |Jing| ) ) )
      ( parent = 'Xiomara' children = VALUE #( ( |Kaito| ) ) )
      ( parent = 'Yuki' children = VALUE #( ( |Leila| ) ) )
      ( parent = 'Zane' children = VALUE #( ( |Mateo| ) ) )
      ( parent = 'Aditi' children = VALUE #( ( |Nia| ) ) )
      ( parent = 'Boris' children = VALUE #( ( |Oscar| ) ) )
      ( parent = 'Celine' children = VALUE #( ( |Priya| ) ) )
      ( parent = 'Diego' children = VALUE #( ( |Qi| ) ) )
      ( parent = 'Elif' children = VALUE #( ( |Rami| ) ) )
      ( parent = 'Farah' children = VALUE #( ( |Sven| ) ) )
      ( parent = 'Giorgio' children = VALUE #( ( |Tomoko| ) ) )
      ( parent = 'Hana' children = VALUE #( ( |Umar| ) ) )
      ( parent = 'Ian' children = VALUE #( ( |Vera| ) ) )
      ( parent = 'Jing' children = VALUE #( ( |Wyatt| ) ) )
      ( parent = 'Kaito' children = VALUE #( ( |Xia| ) ) )
      ( parent = 'Leila' children = VALUE #( ( |Yassin| ) ) )
      ( parent = 'Mateo' children = VALUE #( ( |Zara| ) ) )
      ( parent = 'Nia' children = VALUE #( ( |Antonio| ) ) )
      ( parent = 'Oscar' children = VALUE #( ( |Bianca| ) ) )
      ( parent = 'Priya' children = VALUE #( ( |Cai| ) ) )
      ( parent = 'Qi' children = VALUE #( ( |Dimitri| ) ) )
      ( parent = 'Rami' children = VALUE #( ( |Ewa| ) ) )
      ( parent = 'Sven' children = VALUE #( ( |Fabio| ) ) )
      ( parent = 'Tomoko' children = VALUE #( ( |Gabriela| ) ) )
      ( parent = 'Umar' children = VALUE #( ( |Helena| ) ) )
      ( parent = 'Vera' children = VALUE #( ( |Igor| ) ) )
      ( parent = 'Wyatt' children = VALUE #( ( |Jun| ) ) )
      ( parent = 'Xia' children = VALUE #( ( |Kim| ) ) )
      ( parent = 'Yassin' children = VALUE #( ( |Lucia| ) ) )
      ( parent = 'Zara' children = VALUE #( ( |Mohammed| ) ) ) ).

    cl_abap_unit_assert=>assert_equals(
      act = cut->degree_of_separation(
        family_tree = family_tree
        person_a    = 'Dimitri'
        person_b    = 'Fabio' )
      exp = 9 ).
  ENDMETHOD.

  METHOD test_complex_graph_no_shortcut.
    DATA(family_tree) = VALUE zcl_relative_distance=>ty_family_tree(
      ( parent = 'Aiko' children = VALUE #( ( |Bao| ) ( |Carlos| ) ) )
      ( parent = 'Bao' children = VALUE #( ( |Dalia| ) ( |Elias| ) ) )
      ( parent = 'Carlos' children = VALUE #( ( |Fatima| ) ( |Gustavo| ) ) )
      ( parent = 'Dalia' children = VALUE #( ( |Hassan| ) ( |Isla| ) ) )
      ( parent = 'Elias' children = VALUE #( ( |Javier| ) ) )
      ( parent = 'Fatima' children = VALUE #( ( |Khadija| ) ( |Liam| ) ) )
      ( parent = 'Gustavo' children = VALUE #( ( |Mina| ) ) )
      ( parent = 'Hassan' children = VALUE #( ( |Noah| ) ( |Olga| ) ) )
      ( parent = 'Isla' children = VALUE #( ( |Pedro| ) ) )
      ( parent = 'Javier' children = VALUE #( ( |Quynh| ) ( |Ravi| ) ) )
      ( parent = 'Khadija' children = VALUE #( ( |Sofia| ) ) )
      ( parent = 'Liam' children = VALUE #( ( |Tariq| ) ( |Uma| ) ) )
      ( parent = 'Mina' children = VALUE #( ( |Viktor| ) ( |Wang| ) ) )
      ( parent = 'Noah' children = VALUE #( ( |Xiomara| ) ) )
      ( parent = 'Olga' children = VALUE #( ( |Yuki| ) ) )
      ( parent = 'Pedro' children = VALUE #( ( |Zane| ) ( |Aditi| ) ) )
      ( parent = 'Quynh' children = VALUE #( ( |Boris| ) ) )
      ( parent = 'Ravi' children = VALUE #( ( |Celine| ) ) )
      ( parent = 'Sofia' children = VALUE #( ( |Diego| ) ( |Elif| ) ) )
      ( parent = 'Tariq' children = VALUE #( ( |Farah| ) ) )
      ( parent = 'Uma' children = VALUE #( ( |Giorgio| ) ) )
      ( parent = 'Viktor' children = VALUE #( ( |Hana| ) ( |Ian| ) ) )
      ( parent = 'Wang' children = VALUE #( ( |Jing| ) ) )
      ( parent = 'Xiomara' children = VALUE #( ( |Kaito| ) ) )
      ( parent = 'Yuki' children = VALUE #( ( |Leila| ) ) )
      ( parent = 'Zane' children = VALUE #( ( |Mateo| ) ) )
      ( parent = 'Aditi' children = VALUE #( ( |Nia| ) ) )
      ( parent = 'Boris' children = VALUE #( ( |Oscar| ) ) )
      ( parent = 'Celine' children = VALUE #( ( |Priya| ) ) )
      ( parent = 'Diego' children = VALUE #( ( |Qi| ) ) )
      ( parent = 'Elif' children = VALUE #( ( |Rami| ) ) )
      ( parent = 'Farah' children = VALUE #( ( |Sven| ) ) )
      ( parent = 'Giorgio' children = VALUE #( ( |Tomoko| ) ) )
      ( parent = 'Hana' children = VALUE #( ( |Umar| ) ) )
      ( parent = 'Ian' children = VALUE #( ( |Vera| ) ) )
      ( parent = 'Jing' children = VALUE #( ( |Wyatt| ) ) )
      ( parent = 'Kaito' children = VALUE #( ( |Xia| ) ) )
      ( parent = 'Leila' children = VALUE #( ( |Yassin| ) ) )
      ( parent = 'Mateo' children = VALUE #( ( |Zara| ) ) )
      ( parent = 'Nia' children = VALUE #( ( |Antonio| ) ) )
      ( parent = 'Oscar' children = VALUE #( ( |Bianca| ) ) )
      ( parent = 'Priya' children = VALUE #( ( |Cai| ) ) )
      ( parent = 'Qi' children = VALUE #( ( |Dimitri| ) ) )
      ( parent = 'Rami' children = VALUE #( ( |Ewa| ) ) )
      ( parent = 'Sven' children = VALUE #( ( |Fabio| ) ) )
      ( parent = 'Tomoko' children = VALUE #( ( |Gabriela| ) ) )
      ( parent = 'Umar' children = VALUE #( ( |Helena| ) ) )
      ( parent = 'Vera' children = VALUE #( ( |Igor| ) ) )
      ( parent = 'Wyatt' children = VALUE #( ( |Jun| ) ) )
      ( parent = 'Xia' children = VALUE #( ( |Kim| ) ) )
      ( parent = 'Yassin' children = VALUE #( ( |Lucia| ) ) )
      ( parent = 'Zara' children = VALUE #( ( |Mohammed| ) ) ) ).

    cl_abap_unit_assert=>assert_equals(
      act = cut->degree_of_separation(
        family_tree = family_tree
        person_a    = 'Lucia'
        person_b    = 'Jun' )
      exp = 14 ).
  ENDMETHOD.

  METHOD test_complex_with_shortcuts.
    DATA(family_tree) = VALUE zcl_relative_distance=>ty_family_tree(
      ( parent = 'Aiko' children = VALUE #( ( |Bao| ) ( |Carlos| ) ) )
      ( parent = 'Bao' children = VALUE #( ( |Dalia| ) ) )
      ( parent = 'Carlos' children = VALUE #( ( |Fatima| ) ( |Gustavo| ) ) )
      ( parent = 'Dalia' children = VALUE #( ( |Hassan| ) ( |Isla| ) ) )
      ( parent = 'Fatima' children = VALUE #( ( |Khadija| ) ( |Liam| ) ) )
      ( parent = 'Gustavo' children = VALUE #( ( |Mina| ) ) )
      ( parent = 'Hassan' children = VALUE #( ( |Noah| ) ( |Olga| ) ) )
      ( parent = 'Isla' children = VALUE #( ( |Pedro| ) ) )
      ( parent = 'Javier' children = VALUE #( ( |Quynh| ) ( |Ravi| ) ) )
      ( parent = 'Khadija' children = VALUE #( ( |Sofia| ) ) )
      ( parent = 'Liam' children = VALUE #( ( |Tariq| ) ( |Uma| ) ) )
      ( parent = 'Mina' children = VALUE #( ( |Viktor| ) ( |Wang| ) ) )
      ( parent = 'Noah' children = VALUE #( ( |Xiomara| ) ) )
      ( parent = 'Olga' children = VALUE #( ( |Yuki| ) ) )
      ( parent = 'Pedro' children = VALUE #( ( |Zane| ) ( |Aditi| ) ) )
      ( parent = 'Quynh' children = VALUE #( ( |Boris| ) ) )
      ( parent = 'Ravi' children = VALUE #( ( |Celine| ) ) )
      ( parent = 'Sofia' children = VALUE #( ( |Diego| ) ( |Elif| ) ) )
      ( parent = 'Tariq' children = VALUE #( ( |Farah| ) ) )
      ( parent = 'Uma' children = VALUE #( ( |Giorgio| ) ) )
      ( parent = 'Viktor' children = VALUE #( ( |Hana| ) ( |Ian| ) ) )
      ( parent = 'Wang' children = VALUE #( ( |Jing| ) ) )
      ( parent = 'Xiomara' children = VALUE #( ( |Kaito| ) ) )
      ( parent = 'Yuki' children = VALUE #( ( |Leila| ) ) )
      ( parent = 'Zane' children = VALUE #( ( |Mateo| ) ) )
      ( parent = 'Aditi' children = VALUE #( ( |Nia| ) ) )
      ( parent = 'Boris' children = VALUE #( ( |Oscar| ) ) )
      ( parent = 'Celine' children = VALUE #( ( |Priya| ) ) )
      ( parent = 'Diego' children = VALUE #( ( |Qi| ) ) )
      ( parent = 'Elif' children = VALUE #( ( |Rami| ) ) )
      ( parent = 'Farah' children = VALUE #( ( |Sven| ) ) )
      ( parent = 'Giorgio' children = VALUE #( ( |Tomoko| ) ) )
      ( parent = 'Hana' children = VALUE #( ( |Umar| ) ) )
      ( parent = 'Ian' children = VALUE #( ( |Vera| ) ) )
      ( parent = 'Jing' children = VALUE #( ( |Wyatt| ) ) )
      ( parent = 'Kaito' children = VALUE #( ( |Xia| ) ) )
      ( parent = 'Leila' children = VALUE #( ( |Yassin| ) ) )
      ( parent = 'Mateo' children = VALUE #( ( |Zara| ) ) )
      ( parent = 'Nia' children = VALUE #( ( |Antonio| ) ) )
      ( parent = 'Oscar' children = VALUE #( ( |Bianca| ) ) )
      ( parent = 'Priya' children = VALUE #( ( |Cai| ) ) )
      ( parent = 'Qi' children = VALUE #( ( |Dimitri| ) ) )
      ( parent = 'Rami' children = VALUE #( ( |Ewa| ) ) )
      ( parent = 'Sven' children = VALUE #( ( |Fabio| ) ) )
      ( parent = 'Tomoko' children = VALUE #( ( |Gabriela| ) ) )
      ( parent = 'Umar' children = VALUE #( ( |Helena| ) ) )
      ( parent = 'Vera' children = VALUE #( ( |Igor| ) ) )
      ( parent = 'Wyatt' children = VALUE #( ( |Jun| ) ) )
      ( parent = 'Xia' children = VALUE #( ( |Kim| ) ) )
      ( parent = 'Yassin' children = VALUE #( ( |Lucia| ) ) )
      ( parent = 'Zara' children = VALUE #( ( |Mohammed| ) ) ) ).

    cl_abap_unit_assert=>assert_equals(
      act = cut->degree_of_separation(
        family_tree = family_tree
        person_a    = 'Wyatt'
        person_b    = 'Xia' )
      exp = 12 ).
  ENDMETHOD.

ENDCLASS.
