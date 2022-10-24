*&---------------------------------------------------------------------*
*& Report  ZHSN_EGT_0032
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT ZHSN_EGT_0032.


INCLUDE zhsn_egt_0032_top.
INCLUDE zhsn_egt_0032_pbo.
INCLUDE zhsn_egt_0032_pai.
INCLUDE zhsn_egt_0032_frm.


START-OF-SELECTION.

PERFORM get_data.
PERFORM set_fcat.
PERFORM set_layout.

CALL SCREEN 0100.
