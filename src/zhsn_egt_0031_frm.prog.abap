*&---------------------------------------------------------------------*
*&  Include           ZHSN_EGT_0031_FRM
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Form  GET_DATA
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM get_data .

  DATA: lv_tabix TYPE i.
  DATA: lv_numc  TYPE n LENGTH 8,
        lv_numc_c TYPE char8.

  SELECT * FROM scarr
   INTO CORRESPONDING FIELDS OF TABLE gt_scarr.

*  LOOP AT  gt_scarr ASSIGNING <gfs_scarr>.
*    IF <gfs_scarr>-currcode <> 'EUR'.
*      CLEAR: gs_cellstyle.
*      gs_cellstyle-fieldname = 'URL'.
*    gs_cellstyle-style     = cl_gui_alv_grid=>mc_style_disabled.
**    gs_cellstyle-style     = cl_gui_alv_grid=>mc_style_enabled.  "bu şekilde çalışmaz aklında olsun. önce fieldcatalogdan editible açıp burda kapayabiliyoruz tersi olmuyor.
*    APPEND gs_cellstyle TO <gfs_scarr>-cellstyle.
*    ENDIF.
*  ENDLOOP.

*  LOOP AT gt_scarr ASSIGNING <gfs_scarr>.
*    lv_tabix = lv_tabix + 1.
*    CASE lv_tabix.
*      WHEN 1.
*        gs_cellstyle-fieldname = 'URL'.
*        gs_cellstyle-style     = '00000000'.
*        APPEND gs_cellstyle TO <gfs_scarr>-cellstyle.
*      WHEN 2.
*        gs_cellstyle-fieldname = 'URL'.
*        gs_cellstyle-style     = '00000001'.
*        APPEND gs_cellstyle TO <gfs_scarr>-cellstyle.
*      WHEN 3.
*        gs_cellstyle-fieldname = 'URL'.
*        gs_cellstyle-style     = '00000002'.
*        APPEND gs_cellstyle TO <gfs_scarr>-cellstyle.
*    ENDCASE.
*  ENDLOOP.
*ENDFORM.

  DATA(gt_scarr_tmp) = gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  APPEND LINES OF gt_scarr_tmp TO gt_scarr.
  LOOP AT gt_scarr ASSIGNING <gfs_scarr>.
    lv_numc = lv_numc_c + 1.
    lv_numc_c = lv_numc.

      gs_cellstyle-fieldname = 'URL'.
      gs_cellstyle-style     = lv_numc_c.
      APPEND gs_cellstyle TO <gfs_scarr>-cellstyle.

      <gfs_scarr>-styleval = lv_numc_c.
  ENDLOOP.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  DISPLAY_ALV
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM display_alv .

  IF go_alv IS INITIAL.
    CREATE OBJECT go_alv
      EXPORTING
*       i_parent = go_cont.
        i_parent = cl_gui_container=>screen0.


    CALL METHOD go_alv->set_table_for_first_display
      EXPORTING
*       i_buffer_active =
*       i_bypassing_buffer            =
*       i_consistency_check           =
*       i_structure_name = ''
*       is_variant      =
*       i_save          =
*       i_default       = 'X'
        is_layout       = gs_layout
*       is_print        =
*       it_special_groups             =
*       it_toolbar_excluding          =
*       it_hyperlink    =
*       it_alv_graphics =
*       it_except_qinfo =
*       ir_salv_adapter =
      CHANGING
        it_outtab       = gt_scarr
        it_fieldcatalog = gt_fcat
*       it_sort         =
*       it_filter       =
*  EXCEPTIONS
*       invalid_parameter_combination = 1
*       program_error   = 2
*       too_many_lines  = 3
*       others          = 4
      .


    CALL METHOD go_alv->register_edit_event
      EXPORTING
        i_event_id = cl_gui_alv_grid=>mc_evt_enter
      EXCEPTIONS
        error      = 1
        OTHERS     = 2.
    IF sy-subrc <> 0.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
      WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ENDIF.

*CALL METHOD go_alv->register_edit_event
*EXPORTING
*    i_event_id = cl_gui_alv_grid=>mc_evt_modified
*  EXCEPTIONS
*    error      = 1
*    others     = 2
*  .
*IF sy-subrc <> 0.
* MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
*            WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
*ENDIF.

  ELSE.
    CALL METHOD go_alv->refresh_table_display.
  ENDIF.

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
  CLEAR: gs_fcat.
  gs_fcat-fieldname = 'DURUM'.
  gs_fcat-scrtext_s = 'Durum'.
  gs_fcat-scrtext_m = 'Durum'.
  gs_fcat-scrtext_l = 'Durum'.
*  gs_fcat-col_pos   = 2.
*  gs_fcat-KEY       = abap_true.
  APPEND gs_fcat TO gt_fcat.

  CLEAR: gs_fcat.
  gs_fcat-fieldname = 'CARRID'.
  gs_fcat-scrtext_s = 'Havayolu T'(001).
  gs_fcat-scrtext_m = 'Havayolu Tanımı'.
  gs_fcat-scrtext_l = 'Havayolu şirketinin uzun tanımı'.
*  gs_fcat-col_pos   = 2.
*  gs_fcat-key       = abap_true.
  APPEND gs_fcat TO gt_fcat.

  CLEAR: gs_fcat.
  gs_fcat-fieldname = 'CARRNAME'.
  gs_fcat-scrtext_s = 'Havayolu Ad'.
  gs_fcat-scrtext_m = 'Havayolu adı'.
  gs_fcat-scrtext_l = 'Havayolu şirketinin adı'.
*  gs_fcat-col_pos   = 3.
*  gs_fcat-edit      = abap_true.
  APPEND gs_fcat TO gt_fcat.

  CLEAR: gs_fcat.
  gs_fcat-fieldname = 'CURRCODE'.
  gs_fcat-scrtext_s = 'Havayolu PB'.
  gs_fcat-scrtext_m = 'Havayolu PB'.
  gs_fcat-scrtext_l = 'Havayolu şirketinin ulusal para birimi'.
*  gs_fcat-col_pos   = 4.
*  gs_fcat-hotspot   = abap_true.
  APPEND gs_fcat TO gt_fcat.

  CLEAR: gs_fcat.
  gs_fcat-fieldname = 'URL'.
  gs_fcat-scrtext_s = 'URL'.
  gs_fcat-scrtext_m = 'URL'.
  gs_fcat-scrtext_l = 'Havayolu şirketinin URL'.
*  gs_fcat-edit      = abap_true.
  APPEND gs_fcat TO gt_fcat.

  CLEAR: gs_fcat.
  gs_fcat-fieldname = 'STYLEVAL'.
  gs_fcat-scrtext_s = 'Style'.
  gs_fcat-scrtext_m = 'Style'.
  gs_fcat-scrtext_l = 'Style'.
*  gs_fcat-edit      = abap_true.
  APPEND gs_fcat TO gt_fcat.
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
  gs_layout-no_toolbar = abap_true.
  gs_layout-stylefname = 'CELLSTYLE'.
ENDFORM.
