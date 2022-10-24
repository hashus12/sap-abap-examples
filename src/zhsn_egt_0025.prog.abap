*&---------------------------------------------------------------------*
*& Report  ZHSN_EGT_0025
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zhsn_egt_0025.

"SCARR demo tablosu

TYPES: BEGIN OF gty_type1,
         col1 TYPE char10,
         col2 TYPE char10,
         col3 TYPE char10,
         col4 TYPE char10,
       END OF gty_type1.

TYPES: BEGIN OF gty_type2,
         col2 TYPE char10,
         col4 TYPE char10,
       END OF gty_type2.

DATA: gs_st1 TYPE gty_type1,
      gs_st2 TYPE gty_type2,
      gs_st3 TYPE gty_type2.

START-OF-SELECTION.

  gs_st1-col1 = 'aaaa'.
  gs_st1-col2 = 'bbbb'.
  gs_st1-col3 = 'cccc'.
  gs_st1-col4 = 'dddd'.

*hatalı
*  gs_st2 = gs_st1.
*  MOVE gs_st1 TO gs_st2.

*doğru kullanım
  MOVE-CORRESPONDING gs_st1 TO  gs_st2.
  MOVE gs_st1 TO gs_st3.





*DATA: gt_scarr    TYPE TABLE OF scarr,
*      gt_scarr2   TYPE TABLE OF scarr.
*

  "CTRL+Y + sol tık: se16n deki cell alanları seçmek için****************
*TYPES: BEGIN OF gty_scarr,
*         mandt    TYPE s_mandt,
*         carrid   TYPE s_carr_id,
*         carrname TYPE s_carrname,
*         currcode TYPE s_currcode,
*         url      TYPE s_carrurl,
*       END OF gty_scarr.
*
*DATA: gt_scarr TYPE TABLE OF gty_scarr.
*
*START-OF-SELECTION.

*  SELECT carrid
*         carrname
*    FROM scarr
*  INTO TABLE gt_scarr.
*
*  SELECT carrid
*         carrname
*  FROM scarr
*  INTO CORRESPONDING FIELDS OF TABLE gt_scarr.
