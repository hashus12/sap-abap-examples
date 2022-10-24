*&---------------------------------------------------------------------*
*& Report  ZHSN_EGT_0027
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zhsn_egt_0027.

DATA: gt_table2     TYPE TABLE OF zhsn_egt_0002,
      gt_table2_tmp TYPE TABLE OF zhsn_egt_0002,
      gt_table3     TYPE TABLE OF zhsn_egt_0003,
      gt_table3_tmp TYPE TABLE OF zhsn_egt_0003.



START-OF-SELECTION.

  SELECT * FROM zhsn_egt_0002
    INTO TABLE gt_table2.

  IF gt_table2 IS NOT INITIAL.
    SELECT * FROM  zhsn_egt_0003
    INTO TABLE gt_table3
    FOR ALL ENTRIES IN gt_table2
    WHERE ekipman_id EQ gt_table2-ekipman_id.
  ENDIF.


*  SELECT * FROM  zhsn_egt_0003
*  INTO TABLE gt_table3_tmp
*  FOR ALL ENTRIES IN gt_table2_tmp     "ÖNEMLİ: for all entriesten sonra verilen inretnal table kesinlikle dolu olmalı. Eğer boşsa bütün kayıtları çeker buda istemediğimiz birşey.
*  WHERE ekipman_id EQ gt_table2_tmp-ekipman_id.

  BREAK-POINT.

*TYPES: BEGIN OF gty_ekipman,
*         ekipman_id TYPE zekid,
*         ekipman_ad TYPE zekad,
*         stok       TYPE zekstok,
*       END OF gty_ekipman.
*
*DATA: gt_ekipman TYPE TABLE OF gty_ekipman.
*
*START-OF-SELECTION.
*
*  SELECT * FROM zhsn_egt_0002 AS z2
*  INNER JOIN zhsn_egt_0003 AS z3 ON z3~ekipman_id EQ z2~ekipman_id
*    INTO CORRESPONDING FIELDS OF TABLE gt_ekipman.
*
*    BREAK-POINT.
