FUNCTION z_hsn_egitim_fonksiyonlari.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IV_NUM1) TYPE  INT4 DEFAULT 10
*"     REFERENCE(IV_NUM2) TYPE  INT4 DEFAULT 2
*"  EXPORTING
*"     REFERENCE(EV_SONUC) TYPE  INT4
*"  CHANGING
*"     REFERENCE(CV_MES) TYPE  CHAR20 OPTIONAL
*"  EXCEPTIONS
*"      DIVIDED_BY_ZERO
*"----------------------------------------------------------------------

* if ıv_num2 eq 0.
  IF iv_num2 IS INITIAL.
    RAISE DIVIDED_BY_ZERO.
  ENDIF.

  ev_sonuc = iv_num1 / iv_num2.

  cv_mes = 'Degistirilmis Mesaj'.

ENDFUNCTION.
