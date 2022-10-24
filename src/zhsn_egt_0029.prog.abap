*&---------------------------------------------------------------------*
*& Report  ZHSN_EGT_0029
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zhsn_egt_0029.
"SCARR demo table

TABLES: scarr.

*DATA: gs_scarr TYPE scarr.

START-OF-SELECTION.

"Satır satır verileri tek tek structurea atıyor.
*  SELECT * FROM scarr INTO gs_scarr.
*
*  ENDSELECT.

"Bu mantıklı değil sürekli db ye gidiyor.Performans açısından çok kötü
"kullanılmamalı
SELECT * FROM scarr.

ENDSELECT.
