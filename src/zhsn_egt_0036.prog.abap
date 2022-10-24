*&---------------------------------------------------------------------*
*& Report  ZHSN_EGT_0032
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zhsn_egt_0036.


INCLUDE zhsn_egt_0036_top.
INCLUDE zhsn_egt_0036_cls.
INCLUDE zhsn_egt_0036_pbo.
INCLUDE zhsn_egt_0036_pai.
INCLUDE zhsn_egt_0036_frm.



START-OF-SELECTION.

  PERFORM get_data.
  PERFORM set_fcat.
  PERFORM set_layout.

  CALL SCREEN 0100.
