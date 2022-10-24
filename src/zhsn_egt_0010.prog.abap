*&---------------------------------------------------------------------*
*& Report  ZHSN_EGT_0010
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zhsn_egt_0010 MESSAGE-ID zegt.

START-OF-SELECTION.

*----MESSAGE TYPE------
*  MESSAGE 'Hello Abap World' TYPE 'S'.
*  MESSAGE 'Hello Abap World' TYPE 'I'.
*  MESSAGE 'Hello Abap World' TYPE 'W'.
*  MESSAGE 'Hello Abap World' TYPE 'E'.
*  MESSAGE 'Hello Abap World' TYPE 'A'.
*  MESSAGE 'Hello Abap World' TYPE 'X'.


*----MESSAGE VİEW------
*  MESSAGE 'Hello Abap World' TYPE 'S' DISPLAY LIKE 'X'.
*  MESSAGE 'Hello Abap World' TYPE 'I' DISPLAY LIKE 'E'.
*  MESSAGE 'Hello Abap World' TYPE 'W'.
*  MESSAGE 'Hello Abap World' TYPE 'E'.
*  MESSAGE 'Hello Abap World' TYPE 'A'.
*  MESSAGE 'Hello Abap World' TYPE 'X'.


*----TEXT SYMBOL------
*  MESSAGE text-000 TYPE 'I'.
*  MESSAGE text-001 TYPE 'S'.

*----MESSAGE CLASS----
*  MESSAGE i000.

*  MESSAGE i001 WITH 'Çarşamba'.

  DATA: lv_gun TYPE char20.
  lv_gun = 'Perşembe'.
  MESSAGE i002 WITH 'Çarşamba' lv_gun.
  WRITE: 'Message Egitim Videosu'.
