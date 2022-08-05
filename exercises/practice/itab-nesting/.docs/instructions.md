# Instructions

Learn how to combine data from three different internal tables into one result internal table while nesting the associated data.. 

Your class will be given three internal tables which contain three completely different datasets, ARTISTS, ALBUMS, and SONGS. 


```abap
TYPES: BEGIN OF artists_type,
         artist_id   TYPE string,
         artist_name TYPE string,
       END OF artists_type.
TYPES: artists TYPE STANDARD TABLE OF artists_type WITH KEY artist_id.
TYPES: BEGIN OF albums_type,
         artist_id  TYPE string,
         album_id   TYPE string,
         album_name TYPE string,
       END OF albums_type.
TYPES: albums TYPE STANDARD TABLE OF albums_type WITH KEY artist_id album_id.
TYPES: BEGIN OF songs_type,
         artist_id TYPE string,
         album_id  TYPE string,
         song_id   TYPE string,
         song_name TYPE string,
       END OF songs_type.
TYPES: songs TYPE STANDARD TABLE OF songs_type WITH KEY artist_id album_id song_id.
```

The data in the ARTISTS table is as shown below.

| ARTIST_ID | ARTIST_NAME | 
| --- | --- | 
| 1 | Godsmack | 
| 2 | Disturbed | 
| 3 | Shinedown | 

The data in the ALBUMS table is as shown below.

| ARTIST_ID | ALBUM_ID | ALBUM_NAME |
| --- | --- | --- |
| 1 | 1 | Faceless | 
| 1 | 2 | When Lengends Rise |
| 2 | 1 | The Sickness |
| 2 | 2 | Indestructible | 
| 3 | 1 | The Sound of Madness |
| 3 | 2 | Planet Zero |

The data in the SONGS table is as shown below.

| ARTIST_ID | ALBUM_ID | SONG_ID | SONG_NAME |
| --- | --- | --- | --- |
| 1 | 1 | 1 | Straight Out Of Line |
| 1 | 1 | 2 | Changes |
| 1 | 2 | 1 | Bullet Proof |
| 1 | 2 | 2 | Under Your Scars |
| 2 | 1 | 1 | Voices |
| 2 | 1 | 2 | Stupify |
| 2 | 2 | 1 | Inside The Fire |
| 2 | 2 | 2 | The Night |
| 3 | 1 | 1 | Second Chance |
| 3 | 1 | 2 | Breaking Inside |
| 3 | 2 | 1 | Dysfunctional You |
| 3 | 2 | 2 | Daylight |

Your task is to return an internal table with records which combine the values of each internal table in a structured way, nesting the SONGS internal table into the ALBUMS internal table and of course nesting the ALBUMS internal table into the ARTISTS internal table.  

The expected return table has the following definition:

```abap
TYPES: BEGIN OF song_nested_type,
         song_id   TYPE string,
         song_name TYPE string,
       END OF song_nested_type.
TYPES: BEGIN OF album_song_nested_type,
         album_id   TYPE string,
         album_name TYPE string,
         songs      TYPE STANDARD TABLE OF song_nested_type WITH KEY song_Id,
       END OF album_song_nested_type.
TYPES: BEGIN OF artist_album_nested_type,
         artist_id   TYPE string,
         artist_name TYPE string,
         albums      TYPE STANDARD TABLE OF album_song_nested_type WITH KEY album_id,
       END OF artist_album_nested_type.
TYPES: nested_data TYPE STANDARD TABLE OF artist_album_nested_type WITH KEY artist_id.
```

## Bonus

There are many ways to accomplish this task in ABAP. How efficiently can you complete the task? 
