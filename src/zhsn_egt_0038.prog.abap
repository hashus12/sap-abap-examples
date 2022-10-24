*&---------------------------------------------------------------------*
*& Report  ZHSN_EGT_0032
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT ZHSN_EGT_0038.


INCLUDE ZHSN_EGT_0038_TOP.
INCLUDE ZHSN_EGT_0038_CLS.
INCLUDE ZHSN_EGT_0038_PBO.
INCLUDE ZHSN_EGT_0038_PAI.
INCLUDE ZHSN_EGT_0038_FRM.



START-OF-SELECTION.

PERFORM get_data.
PERFORM set_fcat.
PERFORM set_layout.

CALL SCREEN 0100.
