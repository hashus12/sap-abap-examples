*&---------------------------------------------------------------------*
*& Report  ZHSN_EGT_0011
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zhsn_egt_0011.

DATA: gv_index TYPE i,
      gv_mod2  TYPE i,
      gv_mod3  TYPE i.

START-OF-SELECTION.

  PERFORM form1.

  WRITE: / '2 ye bölünen sayı adedi=', gv_mod2.
  WRITE: / '3 ye bölünen sayı adedi=', gv_mod3.
*&---------------------------------------------------------------------*
*&      Form  FORM1
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM form1 .
  gv_index = 0.

  DO 10 TIMES.
    IF gv_index MOD 2 EQ 0.
      gv_mod2 = gv_mod2 + 1.
    ENDIF.
    IF gv_index MOD 3 EQ 0.
      gv_mod3 = gv_mod3 + 1.
    ENDIF.
    gv_index = gv_index + 1.
  ENDDO.



ENDFORM.
*DATA : gv_num1 TYPE i,
*       gv_num2 TYPE i.
*
*START-OF-SELECTION.
*
*  gv_num1 = 10.
*  gv_num1 = gv_num1 + 1.
*  gv_num1 = gv_num1 + 1.
*  gv_num1 = gv_num1 + 1.
*
*  gv_num2 = 5.
*  gv_num2 = gv_num1 + gv_num2.
*
*  WRITE: gv_num1, gv_num2.
