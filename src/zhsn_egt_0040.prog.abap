*&---------------------------------------------------------------------*
*& Report  ZHSN_EGT_0032
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT ZHSN_EGT_0040.


INCLUDE ZHSN_EGT_0040_TOP.
INCLUDE ZHSN_EGT_0040_CLS.
INCLUDE ZHSN_EGT_0040_PBO.
INCLUDE ZHSN_EGT_0040_PAI.
INCLUDE ZHSN_EGT_0040_FRM.


START-OF-SELECTION.

PERFORM get_data.
PERFORM set_fcat.
PERFORM set_layout.

CALL SCREEN 0100.
