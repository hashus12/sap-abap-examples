*&---------------------------------------------------------------------*
*&  Include           ZHSN_EGT_0005_FRM
*&---------------------------------------------------------------------*


FORM form1 .
  gv_num1 = gv_num1 + 1.
ENDFORM.

FORM form2 .
  gv_num1 = gv_num1 + 1.
  write: gv_num1.
ENDFORM.