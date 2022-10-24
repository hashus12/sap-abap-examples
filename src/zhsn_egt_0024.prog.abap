*&---------------------------------------------------------------------*
*& Report  ZHSN_EGT_0024
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zhsn_egt_0024.

"SCARR demo tablosu

DATA: gt_scarr TYPE TABLE OF scarr,
      gs_scarr TYPE scarr.

START-OF-SELECTION.

  SELECT *
      FROM scarr
      INTO TABLE gt_scarr.

*  READ TABLE gt_scarr INTO  gs_scarr INDEX 4.
*
*  WRITE: gs_scarr.
*
*  READ TABLE gt_scarr INTO gs_scarr WITH KEY carrid = 'AZ'.

*READ TABLE gt_scarr INTO gs_scarr WITH KEY currcode = 'EUR'          "sadece eşittir equal kullanabiliyoruz.
*                                           carrname = 'Alitalia'.
*  WRITE: gs_scarr.


*  LOOP AT gt_scarr INTO gs_scarr WHERE currcode = 'EUR'.
*    WRITE: gs_scarr.
*  ENDLOOP.
