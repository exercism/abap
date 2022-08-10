# Instructions

Learn how to aggregate and group data within an ABAP internal table.

You class will be given an internal table named `initial_numbers`.  It has two columns: `GROUP` and `NUMBER`.

```abap
TYPES: BEGIN OF initial_numbers_type,
        group  TYPE group,
        number TYPE i,
       END OF initial_numbers_type,
       initial_numbers TYPE STANDARD TABLE OF initial_numbers_type WITH EMPTY KEY.
```

The data in this table consists of three groups - A, B, and C.  There are multiple records in each group.

| GROUP | NUMBER |
| --- | ----------- |
| A | 10 |
| B | 5 |
| A | 6 |
| C | 22 |
| A | 13 |
| C | 500 |

Your task is to return an internal table with one record per group. This record should contain the number of records in the original table per group (`COUNT`), the sum of all `NUMBER` values in this group (`SUM)`, the minimum value in the group (`MIN`), the maximum value in the group (`MAX`) and the average of all values in that group (`AVERAGE`).  

The expected return table has the following definition:

```abap
TYPES: BEGIN OF aggregated_data_type,
        group   TYPE group,
        count   TYPE i,
        sum     TYPE i,
        min     TYPE i,
        max     TYPE i,
        average TYPE f,
       END OF aggregated_data_type,
       aggregated_data TYPE STANDARD TABLE OF aggregated_data_Type WITH EMPTY KEY.
```

## Bonus

There are many ways to accomplish this task in ABAP. How efficiently can you complete the task? Can you do this while only reading each record in the table once?
