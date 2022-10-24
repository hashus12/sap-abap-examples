*&---------------------------------------------------------------------*
*&  Include           ZHSN_EGT_0032_FRM
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Form  DISPLAY_ALV
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM display_alv .
  IF go_grid IS INITIAL.
    CREATE OBJECT go_cust
      EXPORTING
        container_name = 'CC_ALV'.

    CREATE OBJECT go_grid
      EXPORTING
        i_parent          = go_cust
      EXCEPTIONS
        error_cntl_create = 1
        error_cntl_init   = 2
        error_cntl_link   = 3
        error_dp_create   = 4
        OTHERS            = 5.
    IF sy-subrc <> 0.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
                 WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ENDIF.

    CREATE OBJECT go_event_receiver.

*    PERFORM set_excluding.
*    PERFORM set_sort.
    PERFORM set_filter.

    CALL METHOD go_grid->set_table_for_first_display
      EXPORTING
        is_layout                     = gs_layout
        it_toolbar_excluding          = gt_exluding
      CHANGING
        it_outtab                     = gt_scarr
        it_fieldcatalog               = gt_fcat
        it_sort                       = gt_sort
        it_filter                     = gt_filter
      EXCEPTIONS
        invalid_parameter_combination = 1
        program_error                 = 2
        too_many_lines                = 3
        OTHERS                        = 4.

  ELSE.
    CALL METHOD go_grid->refresh_table_display.
  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  GET_DATA
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM get_data .
  SELECT * FROM scarr
  INTO CORRESPONDING FIELDS OF TABLE gt_scarr.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  SET_FCAT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM set_fcat .
  CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
    EXPORTING
      i_structure_name = 'SCARR'
    CHANGING
      ct_fieldcat      = gt_fcat.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  SET_LAYOUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM set_layout .
  CLEAR: gs_layout.
  gs_layout-cwidth_opt = abap_true.
*  gs_layout-no_toolbar = abap_true.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  SET_EXCLUDING
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM set_excluding .
  CLEAR: gv_exluding.
  gv_exluding = cl_gui_alv_grid=>mc_fc_detail.
  APPEND gv_exluding TO gt_exluding.
  CLEAR: gv_exluding.
  gv_exluding = cl_gui_alv_grid=>mc_fc_find.
  APPEND gv_exluding TO gt_exluding.
  CLEAR: gv_exluding.
  gv_exluding = cl_gui_alv_grid=>mc_fc_sort_asc.
  APPEND gv_exluding TO gt_exluding.
  CLEAR: gv_exluding.
  gv_exluding = cl_gui_alv_grid=>mc_fc_sort_dsc.
  APPEND gv_exluding TO gt_exluding.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  SET_SORT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM set_sort .
  CLEAR: gs_sort.
  gs_sort-spos = 1.
  gs_sort-fieldname = 'CURRCODE'.
  gs_sort-down      = abap_true.
  APPEND gs_sort TO gt_sort.

  CLEAR: gs_sort.
  gs_sort-spos = 2.
  gs_sort-fieldname = 'CARRNAME'.
  gs_sort-up        = abap_true.
  APPEND gs_sort TO gt_sort.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  SET_FILTER
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM set_filter .
  CLEAR: gs_filter.
  gs_filter-tabname   = 'GT_SCARR'.
  gs_filter-fieldname = 'CURRCODE'.
  gs_filter-sign      = 'I'.
  gs_filter-option    = 'EQ'.
  gs_filter-low       = 'USD'.
*  gs_filter-high      =
  APPEND gs_filter TO gt_filter.
  endform.
