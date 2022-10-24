*&---------------------------------------------------------------------*
*& Report  ZHSN_EGT_0001
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zhsn_egt_0001.

DATA gv_desg1 TYPE p DECIMALS 2.
DATA gv_desg2 TYPE int4.
DATA gv_desg7 TYPE int4.
DATA gv_desg3(10) TYPE n.
DATA gv_desg4(10) TYPE c.
DATA gv_desg5 TYPE string.

BREAK hasan.

gv_desg1 = '15.48'.
gv_desg1 = '55.4785'.

gv_desg2 = 145.
gv_desg7 = 15.
gv_desg2 = 81.

gv_desg3 = 631.

gv_desg4 = 'C'.

gv_desg5 = 'Merhaba Dünya'.

gv_desg2 = gv_desg2 * 3 / 10 + gv_desg7 * 7 / 10.
BREAK-POINT.
