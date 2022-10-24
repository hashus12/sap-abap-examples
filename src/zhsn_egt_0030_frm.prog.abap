*&---------------------------------------------------------------------*
*&  Include           ZHSN_EGT_0030_FRM
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
*  CREATE OBJECT go_cont
*    EXPORTING
*      container_name = 'CC_ALV'.  "screende oluşturduğumuz custom container idsini verdik.

  IF go_alv IS INITIAL.
    CREATE OBJECT go_alv
      EXPORTING
*       i_parent = go_cont.        "obje tanımı istiyor.
        i_parent = cl_gui_container=>screen0.  "container olmadan fulllscreende göstermek istersek böyle yapabiliriz.

    PERFORM set_dropdown.

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

  LOOP AT gt_scarr ASSIGNING <gfs_scarr>.
    CASE <gfs_scarr>-currcode.
    WHEN 'EUR'.
      <gfs_scarr>-dd_handle = '3'.
    WHEN 'USD'.
      <gfs_scarr>-dd_handle = '4'.
    WHEN 'JPY'.
      <gfs_scarr>-dd_handle = '5'.
    ENDCASE.
  ENDLOOP.
*  LOOP AT gt_scarr ASSIGNING <gfs_scarr>.
*    <gfs_scarr>-durum = '@0B@'.
*  ENDLOOP.

*  LOOP AT gt_scarr ASSIGNING <gfs_scarr>.
*    CASE <gfs_scarr>-currcode.
*      WHEN 'USD'.
*        <gfs_scarr>-line_color = 'C710'.
*      WHEN 'JFY'.
*        <gfs_scarr>-line_color = 'C510'.
*      WHEN 'EUR'.
*        CLEAR gs_cell_color.
*        gs_cell_color-fname = 'URL'.
*        gs_cell_color-color-col = '3'.
*        gs_cell_color-color-int = '1'.
*        gs_cell_color-color-inv = '0'.
*      APPEND gs_cell_color TO <gfs_scarr>-cell_color.
*    ENDCASE.
*  ENDLOOP.
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
  APPEND gs_fcat TO gt_fcat.

  CLEAR: gs_fcat.
  gs_fcat-fieldname = 'COST'.
  gs_fcat-scrtext_s = 'Fiyat'.
  gs_fcat-scrtext_m = 'Fiyat'.
  gs_fcat-scrtext_l = 'Fiyat'.
  gs_fcat-edit      = abap_true.
*  gs_fcat-col_pos   = 1.
*  gs_fcat-col_opt   = abap_true.|
*  gs_fcat-no_out    = abap_true.
*  gs_fcat-outputlen = 100.
*   gs_fcat-ref_table = 'SCARR'.
*   gs_fcat-ref_field = 'URL'.   "data elementtinden tanımlarını alıyor uzunluk vs.
  APPEND gs_fcat TO gt_fcat.

  CLEAR: gs_fcat.
  gs_fcat-fieldname = 'LOCATION'.
  gs_fcat-scrtext_s = 'Lokasyon'.
  gs_fcat-scrtext_m = 'Lokasyon'.
  gs_fcat-scrtext_l = 'Lokasyon'.
  gs_fcat-edit      = abap_true.
  gs_fcat-drdn_hndl = 1.
  APPEND gs_fcat TO gt_fcat.

  CLEAR: gs_fcat.
  gs_fcat-fieldname = 'SEATL'.
  gs_fcat-scrtext_s = 'Koltuk Harf'.
  gs_fcat-scrtext_m = 'Koltuk Harf'.
  gs_fcat-scrtext_l = 'Koltuk Harf'.
  gs_fcat-edit      = abap_true.
  gs_fcat-drdn_hndl = 2.
  APPEND gs_fcat TO gt_fcat.

  CLEAR: gs_fcat.
  gs_fcat-fieldname  = 'SEATP'.
  gs_fcat-scrtext_s  = 'Koltuk pos'.
  gs_fcat-scrtext_m  = 'Koltuk pos'.
  gs_fcat-scrtext_l  = 'Koltuk pos'.
  gs_fcat-edit       = abap_true.
  gs_fcat-drdn_field = 'DD_HANDLE'.
  APPEND gs_fcat TO gt_fcat.

*  CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
*    EXPORTING
*      i_structure_name       = 'SCARR'
**     i_structure_name       = 'ZHSN_EGT_0030S'
**     I_INTERNAL_TABNAME     =
*    CHANGING
*      ct_fieldcat            = gt_fcat
*    EXCEPTIONS
*      inconsistent_interface = 1
*      program_error          = 2
*      OTHERS                 = 3.
*  IF sy-subrc <> 0.
** Implement suitable error handling here
*  ENDIF.
*
*  READ TABLE gt_fcat ASSIGNING <gfs_fc> WITH KEY fieldname = 'MESS'.
*  IF sy-subrc EQ 0.
*    <gfs_fc>-no_out = abap_true.
*    <gfs_fc>-edit = abap_true.
*  ENDIF.

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
*  gs_layout-edit = abap_true.
  gs_layout-no_toolbar = abap_true.
*  gs_layout-zebra = abap_true.
*  gs_layout-info_fname = 'LINE_COLOR'.
*  gs_layout-ctab_fname = 'CELL_COLOR'.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  GET_TOTAL_SUM
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM get_total_sum .
*  DATA: lv_ttl_sum   TYPE int4,
*        lv_ttl_sum_c TYPE char10,
*        lv_mess      TYPE char200.
*
*  LOOP AT gt_scarr INTO gs_scarr.
*    lv_ttl_sum = lv_ttl_sum + gs_scarr-cost.
*  ENDLOOP.
*
*  lv_ttl_sum_c = lv_ttl_sum.
*
*  CONCATENATE 'Tüm satırların toplamı = '
*              lv_ttl_sum_c
*              INTO lv_mess.
*
*  MESSAGE lv_mess TYPE 'I'.

  DATA: lv_ttl_sum TYPE int4,
        lv_lines   TYPE int4,
        lv_avr     TYPE int4.

  LOOP AT gt_scarr INTO gs_scarr.
    lv_ttl_sum = lv_ttl_sum + gs_scarr-cost.
  ENDLOOP.

  " tablodaki satır sayısını alır.
  DESCRIBE TABLE gt_scarr LINES lv_lines.

  lv_avr = lv_ttl_sum / lv_lines.

  LOOP AT gt_scarr ASSIGNING <gfs_scarr>.
    IF <gfs_scarr>-cost > lv_avr.
      <gfs_scarr>-durum = '@0A@'.
    ELSEIF <gfs_scarr>-cost < lv_avr.
      <gfs_scarr>-durum = '@08@'.
    ELSE.
      <gfs_scarr>-durum = '@09@'.
    ENDIF.
  ENDLOOP.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  SET_DROPDOWN
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM set_dropdown .
  DATA: lt_dropdown TYPE lvc_t_drop,
        ls_dropdown TYPE lvc_s_drop.

  CLEAR: ls_dropdown.
  ls_dropdown-handle = 1.
  ls_dropdown-value = 'Yurtiçi'.
  APPEND ls_dropdown TO lt_dropdown.

  CLEAR: ls_dropdown.
  ls_dropdown-handle = 1.
  ls_dropdown-value = 'Yurtdışı'.
  APPEND ls_dropdown TO lt_dropdown.

  CLEAR: ls_dropdown.
  ls_dropdown-handle = 2.
  ls_dropdown-value = 'A'.
  APPEND ls_dropdown TO lt_dropdown.
  CLEAR: ls_dropdown.
  ls_dropdown-handle = 2.
  ls_dropdown-value = 'B'.
  APPEND ls_dropdown TO lt_dropdown.
  CLEAR: ls_dropdown.
  ls_dropdown-handle = 2.
  ls_dropdown-value = 'C'.
  APPEND ls_dropdown TO lt_dropdown.
  CLEAR: ls_dropdown.
  ls_dropdown-handle = 2.
  ls_dropdown-value = 'D'.
  APPEND ls_dropdown TO lt_dropdown.
  CLEAR: ls_dropdown.
  ls_dropdown-handle = 2.
  ls_dropdown-value = 'E'.
  APPEND ls_dropdown TO lt_dropdown.
  CLEAR: ls_dropdown.
  ls_dropdown-handle = 2.
  ls_dropdown-value = 'F'.
  APPEND ls_dropdown TO lt_dropdown.

  CLEAR: ls_dropdown.
  ls_dropdown-handle = 3.
  ls_dropdown-VALUE = 'Ön'.
  APPEND ls_dropdown TO lt_dropdown.
  CLEAR: ls_dropdown.
  ls_dropdown-handle = 3.
  ls_dropdown-VALUE = 'Kanat'.
  APPEND ls_dropdown TO lt_dropdown.
  CLEAR: ls_dropdown.
  ls_dropdown-handle = 3.
  ls_dropdown-VALUE = 'Arka'.
  APPEND ls_dropdown TO lt_dropdown.

  CLEAR: ls_dropdown.
  ls_dropdown-handle = 4.
  ls_dropdown-VALUE = 'Ön'.
  APPEND ls_dropdown TO lt_dropdown.
  CLEAR: ls_dropdown.
  ls_dropdown-handle = 4.
  ls_dropdown-VALUE = 'Arka'.
  APPEND ls_dropdown TO lt_dropdown.

  CLEAR: ls_dropdown.
  ls_dropdown-handle = 5.
  ls_dropdown-VALUE = 'Kanat'.
  APPEND ls_dropdown TO lt_dropdown.

  go_alv->set_drop_down_table(
    EXPORTING
      it_drop_down = lt_dropdown
  ).
ENDFORM.
