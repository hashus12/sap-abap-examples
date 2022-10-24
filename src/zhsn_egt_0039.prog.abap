*&---------------------------------------------------------------------*
*& Report  ZHSN_EGT_0032
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT ZHSN_EGT_0039.


INCLUDE ZHSN_EGT_0039_TOP.
INCLUDE ZHSN_EGT_0039_CLS.
INCLUDE ZHSN_EGT_0039_PBO.
INCLUDE ZHSN_EGT_0039_PAI.
INCLUDE ZHSN_EGT_0039_FRM.

START-OF-SELECTION.

PERFORM get_data.
PERFORM set_fcat.
PERFORM set_layout.

CALL SCREEN 0100.
