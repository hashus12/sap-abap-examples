*&---------------------------------------------------------------------*
*& Report  ZHSN_EGT_0030
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
"ICON hazır tablo
"BCALV_EDIT_06 dropdown hazır program.
"BCALV_EDIT_07 dynamic dropdown hazır program.

REPORT zhsn_egt_0030.

INCLUDE zhsn_egt_0030_top.
INCLUDE zhsn_egt_0030_pbo.
INCLUDE zhsn_egt_0030_pai.
INCLUDE zhsn_egt_0030_frm.

START-OF-SELECTION.

  PERFORM get_data.
  PERFORM set_fcat.
  PERFORM set_layout.

  CALL SCREEN 0100.
