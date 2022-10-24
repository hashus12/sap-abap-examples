*&---------------------------------------------------------------------*
*& Report  ZHSN_EGT_0033
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT ZHSN_EGT_0033.

INCLUDE zhsn_egt_0033_top.
INCLUDE zhsn_egt_0033_cls.
INCLUDE zhsn_egt_0033_pbo.
INCLUDE zhsn_egt_0033_pai.
INCLUDE zhsn_egt_0033_frm.


START-OF-SELECTION.

PERFORM get_data.
PERFORM set_fcat.
PERFORM set_layout.

CALL SCREEN 0100.
