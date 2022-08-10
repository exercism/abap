# Instructions

Learn how to combine data from two different internal tables into one result internal table. 

Your class will be given two internal tables which contain two completely different datasets, ALPHAS and NUMS


```abap
TYPES: BEGIN OF alphatab_type,
         cola TYPE string,
         colb TYPE string,
         colc TYPE string,
       END OF alphatab_type.
TYPES: alphas TYPE STANDARD TABLE OF alphatab_type.
TYPES: BEGIN OF numtab_type,
         col1 TYPE string,
         col2 TYPE string,
         col3 TYPE string,
       END OF numtab_type.
TYPES: nums TYPE STANDARD TABLE OF numtab_type.
```

The data in the ALPHA table is as shown below.

| COLA | COLB | COLC |
| --- | --- | --- |
| A | B | C | 
| D | E | F |
| G | H | I |

The data in the NUMS table is as shown below.

| COL1 | COL2 | COL3 |
| --- | --- | --- |
| 1 | 2 | 3 | 
| 4 | 5 | 6 |
| 7 | 8 | 9 |

Your task is to return an internal table with records which combine the values of each cell of interal table ALPHAS and internal table NUMS together. For example the value of the first column of the first row of the COMBINED_DATA internal table should be "A1".

The expected return table has the following definition:

```abap
TYPES: BEGIN OF combined_data_type,
         colx TYPE string,
         coly TYPE string,
         colz TYPE string,
       END OF combined_data_type.
TYPES: combined_data TYPE STANDARD TABLE OF combined_data_type WITH EMPTY KEY.
```

## Bonus

There are many ways to accomplish this task in ABAP. How efficiently can you complete the task? 
