*&---------------------------------------------------------------------*
*& Report  ZHSN_EGT_0026
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zhsn_egt_0026.



TYPES: BEGIN OF gty_ekipman,
         ekipman_id  TYPE zekid,
         ekipman_ad  TYPE zekad,
         stok        TYPE zekstok,
         ekipman_en  TYPE zeken,
         ekipman_boy TYPE zekboy,
       END OF gty_ekipman.

DATA: gt_ekipman TYPE TABLE OF gty_ekipman.

START-OF-SELECTION.

*  SELECT *
*    FROM zhsn_egt_0002
*    INTO CORRESPONDING FIELDS OF TABLE gt_ekipman.

*  SELECT *
*    FROM zhsn_egt_0002
*    INNER JOIN zhsn_egt_0003 ON
*    zhsn_egt_0002~ekipman_id EQ zhsn_egt_0003~ekipman_id
*  INTO CORRESPONDING FIELDS OF TABLE gt_ekipman.

*  SELECT *
*  FROM zhsn_egt_0002
*  INNER JOIN zhsn_egt_0003 ON
*  zhsn_egt_0002~ekipman_id EQ zhsn_egt_0003~ekipman_id
*  INTO CORRESPONDING FIELDS OF TABLE gt_ekipman.


  " AS tabloya kısa isim vererek sorguları kısaltmamıza yarıyor. daha okunabilir.
*  SELECT
*    z2~ekipman_id
*    z2~ekipman_ad
*    z3~stok
*  FROM zhsn_egt_0002 AS z2
*  INNER JOIN zhsn_egt_0003 AS z3 ON
*  z2~ekipman_id EQ z3~ekipman_id
*  INTO CORRESPONDING FIELDS OF TABLE gt_ekipman.
*  BREAK-POINT.

*  SELECT
*  z2~ekipman_id
*  z2~ekipman_ad
*  z3~stok
*  FROM zhsn_egt_0002 AS z2
*  LEFT JOIN zhsn_egt_0003 AS z3 ON
*  z2~ekipman_id EQ z3~ekipman_id
*  INTO CORRESPONDING FIELDS OF TABLE gt_ekipman.

  "aynı bişey farketmiyor
*  SELECT
*  z2~ekipman_id
*  z2~ekipman_ad
*  z3~stok
*  FROM zhsn_egt_0002 AS z2
*  LEFT OUTER JOIN zhsn_egt_0003 AS z3 ON
*  z2~ekipman_id EQ z3~ekipman_id
*  INTO CORRESPONDING FIELDS OF TABLE gt_ekipman.

*  SELECT
*  z3~ekipman_id,
*  z2~ekipman_ad,
*  z3~stok
*  FROM zhsn_egt_0002 AS z2
*  RIGHT JOIN zhsn_egt_0003 AS z3 ON
*  z2~ekipman_id EQ z3~ekipman_id
*  INTO CORRESPONDING FIELDS OF TABLE @gt_ekipman.

*  SELECT
*    z2~ekipman_id
*    z2~ekipman_ad
*    z3~stok
*    z4~ekipman_en
*    z4~ekipman_boy
*  FROM zhsn_egt_0002 AS z2
*  JOIN zhsn_egt_0003 AS z3 ON z2~ekipman_id EQ z3~ekipman_id
*  JOIN zhsn_egt_0004 AS z4 ON z4~ekipman_idsi EQ z2~ekipman_id
*  INTO CORRESPONDING FIELDS OF TABLE gt_ekipman.

  SELECT
  z2~ekipman_id
  z2~ekipman_ad
  z3~stok
  z4~ekipman_en
  z4~ekipman_boy
  FROM zhsn_egt_0002 AS z2
  JOIN zhsn_egt_0003 AS z3 ON z2~ekipman_id EQ z3~ekipman_id
  LEFT JOIN zhsn_egt_0004 AS z4 ON z4~ekipman_idsi EQ z2~ekipman_id
  INTO CORRESPONDING FIELDS OF TABLE gt_ekipman.

  BREAK-POINT.
