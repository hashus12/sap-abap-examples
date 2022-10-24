*&---------------------------------------------------------------------*
*& Report  ZHSN_EGT_0018
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zhsn_egt_0018.

*DATA: gv_name    TYPE char20,
*      gv_surname TYPE char30,
*      gv_age     TYPE num4.
*
*DATA: gv_flag TYPE xfeld.

DATA: gv_num TYPE i.
DATA: gv_text1 TYPE char10,
      gv_text2 TYPE char10,
      gv_text3 TYPE char10,
      gv_text4 TYPE char10.

START-OF-SELECTION.

  CALL SCREEN 0200.
*&---------------------------------------------------------------------*
*&      Module  STATUS_0100  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*MODULE status_0100 OUTPUT.
*  SET PF-STATUS '0100'.
**  SET TITLEBAR 'xxx'.
*
*
*  LOOP AT SCREEN.
*    IF gv_flag EQ abap_true.
*      IF screen-group1 EQ abap_true.
*        screen-input = 1.
*        MODIFY SCREEN.
*      ENDIF.
*    ENDIF.
*
*    IF gv_flag EQ abap_false.
*      IF screen-group1 EQ abap_true.
*        screen-input = 0.
*        MODIFY SCREEN.
*      ENDIF.
*    ENDIF.
*  ENDLOOP.
*
**  LOOP AT SCREEN.
**    if screen-group1 eq 'X'. "gruplarsak daha kolay daha iyi olur. layouttan gruplayabiliriz.
**      screen-input = 0.
**      MODIFY SCREEN.
**    ENDIF.
**  ENDLOOP.
*
**  LOOP AT SCREEN. "Screen deki objeleri tek tek dönüyor 'screen' structruı içinde
**    IF screen-name EQ 'GV_NAME'.
**      screen-active = 0.
**      MODIFY SCREEN. "ekranda yaptığımız işlemin aktif olması için direk etkiler.
**    ENDIF.
**
**    IF screen-name EQ 'GV_SURNAME'.
**      screen-invisible = 1. "Text fieldlarda bu karakter görünümünü kapatıyor.
**      MODIFY SCREEN.
**    ENDIF.
**
**    IF screen-name EQ 'GV_AGE'.
**      screen-input = 0.
**      MODIFY SCREEN.
**    ENDIF.
**  ENDLOOP.
*ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*MODULE user_command_0100 INPUT.
*  CASE sy-ucomm.
*    WHEN '&BACK'.
*      SET SCREEN 0.
*    WHEN '&ENABLE'.
*      gv_flag = abap_true. " X
*    WHEN '&DISABLE'.
*      gv_flag = abap_false. " ' '
*  ENDCASE.
*ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  STATUS_0200  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE status_0200 OUTPUT.
  SET PF-STATUS '0100'.
  IF gv_num > 4.
     MESSAGE '1 ve 4 arasında değer girin.' TYPE 'I'.
  ENDIF.
  LOOP AT SCREEN.
    IF screen-group1 EQ abap_true.
      screen-input = 0.
      MODIFY SCREEN.
    ENDIF.
    IF screen-group2 EQ abap_true.
      screen-input = 0.
      MODIFY SCREEN.
    ENDIF.
    IF screen-group3 EQ abap_true.
      screen-input = 0.
      MODIFY SCREEN.
    ENDIF.
    IF screen-group4 EQ abap_true.
      screen-input = 0.
      MODIFY SCREEN.
    ENDIF.
  ENDLOOP.
  LOOP AT SCREEN.
    CASE gv_num.
      WHEN 1.
        IF screen-group1 EQ abap_true.
          screen-input = 1.
          MODIFY SCREEN.
        ENDIF.
      WHEN 2.
        IF screen-group2 EQ abap_true.
          screen-input = 1.
          MODIFY SCREEN.
        ENDIF.
      WHEN 3.
        IF screen-group3 EQ abap_true.
          screen-input = 1.
          MODIFY SCREEN.
        ENDIF.
      WHEN 4.
        IF screen-group4 EQ abap_true.
          screen-input = 1.
          MODIFY SCREEN.
        ENDIF.
    ENDCASE.
  ENDLOOP.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0200  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0200 INPUT.
  CASE sy-ucomm.
    WHEN '&BACK'.
      SET SCREEN 0.
  ENDCASE.
ENDMODULE.
