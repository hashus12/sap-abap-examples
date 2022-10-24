*&---------------------------------------------------------------------*
*& Report  ZHSN_EGT_0022_NEW
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT ZHSN_EGT_0022_NEW.

INCLUDE zhsn_egt_0022_new_top.
INCLUDE zhsn_egt_0022_new_frm.

INITIALIZATION.
"defaultta bir şey tanımlıysa onu getir ama yanına search helpi de koy istediğinde seçip ezebilsin önayarı.
gs_variant_get-REPORT = sy-repid.
CALL FUNCTION 'REUSE_ALV_VARIANT_DEFAULT_GET'
CHANGING
  cs_variant    = gs_variant_get
EXCEPTIONS
  wrong_input   = 1
  not_found     = 2
  program_error = 3
  OTHERS        = 4.
IF sy-subrc EQ 0.
  p_vari = gs_variant_get-variant.
ENDIF.

"parametreye search help ekliyor bastığımızda bu kod bloğu çalışıyor.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_vari.
gs_variant_get-REPORT = sy-repid.
CALL FUNCTION 'REUSE_ALV_VARIANT_F4'
EXPORTING
  is_variant    = gs_variant_get
IMPORTING
  e_exit        = gv_exit
  es_variant    = gs_variant_get
EXCEPTIONS
  not_found     = 1
  program_error = 2
  OTHERS        = 3.
IF sy-subrc EQ 0.
  IF gv_exit IS INITIAL.
    p_vari = gs_variant_get-variant.
  ENDIF.
ENDIF.



START-OF-SELECTION.

PERFORM get_data.
PERFORM set_fc.  "field catalog
PERFORM set_layout.
PERFORM display_alv.
