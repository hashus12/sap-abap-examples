*&---------------------------------------------------------------------*
*& Report  ZHSN_EGT_0023
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zhsn_egt_0023.

"SCARR demo tablosu

DATA: gt_scarr TYPE TABLE OF scarr,
      gs_scarr TYPE scarr,
      gv_currcode TYPE s_currcode.

START-OF-SELECTION.

*  SELECT *
*    FROM scarr
*    INTO TABLE gt_scarr
*    WHERE carrid EQ 'AC'.
*
*  READ TABLE gt_scarr INTO gs_scarr INDEX 1.
*
*  WRITE: gs_scarr-currcode.
*
*SELECT *
*  UP TO 5 ROWS
*  FROM scarr
*  INTO TABLE gt_scarr.

*SELECT SINGLE *
*  FROM scarr
*  INTO gs_scarr
*  WHERE carrid EQ 'AC'.
*
*WRITE: gs_scarr-currcode.

"Daha profesyonel
SELECT SINGLE currcode
FROM scarr
INTO gv_currcode
WHERE carrid EQ 'AC'.

WRITE: gv_currcode.
