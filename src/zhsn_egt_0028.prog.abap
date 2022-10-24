*&---------------------------------------------------------------------*
*& Report  ZHSN_EGT_0028
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zhsn_egt_0028.
"SCARR demo table

DATA: gt_scarr TYPE TABLE OF scarr,
      gs_scarr TYPE scarr.


"Çok daha pratik bol kullanılır. loop ve read table da kullanılabilir.

FIELD-SYMBOLS: <gfs_scarr> TYPE scarr.

START-OF-SELECTION.

  SELECT * FROM scarr
    INTO TABLE gt_scarr.

*  LOOP AT gt_scarr INTO gs_scarr.
*    IF gs_scarr-carrid EQ 'LH'.
*      gs_scarr-carrname = 'Hasan Özgen'.
*      MODIFY gt_scarr FROM gs_scarr.
*    ENDIF.
*  ENDLOOP.

******************************************
  "Anlık olarak gt_scarrdan referans alıyor tabledan da index alıyor. field symbolde değişiklik yaptığımız zaman anlık olarakda internal table'da değişmiş olacak o veri. Pointer mantığı var.
*  LOOP AT gt_scarr ASSIGNING <gfs_scarr>.
*    IF <gfs_scarr>-carrid EQ 'LH'.
*      <gfs_scarr>-carrname = 'Hasan Özgen'.
*    ENDIF.
*  ENDLOOP.

*  READ TABLE gt_scarr INTO gs_scarr WITH KEY carrid = 'LH'.
*  gs_scarr-carrname = 'Hasan Özgen'.
*  MODIFY gt_scarr FROM gs_scarr.

  READ TABLE gt_scarr ASSIGNING <gfs_scarr> WITH KEY carrid = 'LH'.
  <gfs_scarr>-carrname = 'Hasan Özgen'.

  BREAK-POINT.
