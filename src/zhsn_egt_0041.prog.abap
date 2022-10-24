*&---------------------------------------------------------------------*
*& Report  ZHSN_EGT_0032
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zhsn_egt_0041.


INCLUDE zhsn_egt_0041_top.
INCLUDE zhsn_egt_0041_cls.
INCLUDE zhsn_egt_0041_pbo.
INCLUDE zhsn_egt_0041_pai.
INCLUDE zhsn_egt_0041_frm.

INITIALIZATION.

  gs_variant_tmp-report = sy-repid.

  CALL FUNCTION 'LVC_VARIANT_DEFAULT_GET'
    EXPORTING
      i_save        = 'A'
    CHANGING
      cs_variant    = gs_variant_tmp
    EXCEPTIONS
      wrong_input   = 1
      not_found     = 2
      program_error = 3
      OTHERS        = 4.
  IF sy-subrc = 0.
    p_vari = gs_variant_tmp-variant.
  ENDIF.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_vari.

  CALL FUNCTION 'LVC_VARIANT_F4'
    EXPORTING
      is_variant    = gs_variant_tmp
*     IT_DEFAULT_FIELDCAT       =
      i_save        = 'A'
    IMPORTING
*     E_EXIT        =
      es_variant    = gs_variant_tmp
    EXCEPTIONS
      not_found     = 1
      program_error = 2
      OTHERS        = 3.
  IF sy-subrc EQ 0.
    p_vari = gs_variant_tmp-variant.
  ENDIF.


START-OF-SELECTION.

  PERFORM get_data.
  PERFORM set_fcat.
  PERFORM set_layout.

  CALL SCREEN 0100.
