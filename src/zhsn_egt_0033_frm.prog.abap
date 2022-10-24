*&---------------------------------------------------------------------*
*&  Include           ZHSN_EGT_0033_FRM
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

  CREATE OBJECT go_cust
    EXPORTING
      container_name = 'CC_ALV'.

  IF go_grid IS INITIAL.


    CREATE OBJECT go_spli
      EXPORTING
        parent            = go_cust
        rows              = 2
        columns           = 1
      EXCEPTIONS
        cntl_error        = 1
        cntl_system_error = 2
        OTHERS            = 3.
    IF sy-subrc <> 0.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
                 WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ENDIF.

    CALL METHOD go_spli->get_container
      EXPORTING
        row       = 1
        column    = 1
      RECEIVING
        container = go_sub1.

    CALL METHOD go_spli->get_container
      EXPORTING
        row       = 2
        column    = 1
      RECEIVING
        container = go_sub2.

    CALL METHOD go_spli->set_row_height
      EXPORTING
        id                = 1
        height            = 15
      EXCEPTIONS
        cntl_error        = 1
        cntl_system_error = 2
        OTHERS            = 3.
    IF sy-subrc <> 0.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
                 WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ENDIF.

    CREATE OBJECT go_docu
      EXPORTING
        style = 'ALV_GRID'
*       background_color =
*       bds_stylesheet   =
*       no_margins       =
      .

    CREATE OBJECT go_grid
      EXPORTING
        i_parent = go_sub2.
*      i_parent = cl_gui_container=>screen0.

    CREATE OBJECT go_event_recevier.
    SET HANDLER go_event_recevier->handle_top_of_page FOR go_grid.

    CALL METHOD go_grid->set_table_for_first_display
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

    CALL METHOD go_grid->list_processing_events
      EXPORTING
        i_event_name = 'TOP_OF_PAGE'
        i_dyndoc_id  = go_docu.

*
*    CALL METHOD go_grid->register_edit_event
*      EXPORTING
*        i_event_id = cl_gui_alv_grid=>mc_evt_enter
*      EXCEPTIONS
*        error      = 1
*        OTHERS     = 2.
*    IF sy-subrc <> 0.
*      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
*      WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
*    ENDIF.

*CALL METHOD go_grid->register_edit_event
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
  gs_layout-no_toolbar = abap_true.
ENDFORM.
