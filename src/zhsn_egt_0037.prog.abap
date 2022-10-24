*&---------------------------------------------------------------------*
*& Report  ZHSN_EGT_0032
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zhsn_egt_0037.


INCLUDE zhsn_egt_0037_top.
INCLUDE zhsn_egt_0037_cls.
INCLUDE zhsn_egt_0037_pbo.
INCLUDE zhsn_egt_0037_pai.
INCLUDE zhsn_egt_0037_frm.


START-OF-SELECTION.

  PERFORM get_data.
  PERFORM set_fcat.
  PERFORM set_layout.

  CALL SCREEN 0100.
