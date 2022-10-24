*&---------------------------------------------------------------------*
*& Report  ZHSN_EGT_0031
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT ZHSN_EGT_0031.

INCLUDE zhsn_egt_0031_top.
INCLUDE zhsn_egt_0031_pbo.
INCLUDE zhsn_egt_0031_pai.
INCLUDE zhsn_egt_0031_frm.


START-OF-SELECTION.

  PERFORM get_data.
  PERFORM set_fcat.
  PERFORM set_layout.

  CALL SCREEN 0100.
