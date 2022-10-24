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
  CREATE OBJECT go_cust
    EXPORTING
      container_name = 'CC_ALV'.

  " go_cust'ı ayrılmış bir şekilde tutuyor.
  CREATE OBJECT go_splitter
    EXPORTING
*     link_dynnr        =
*     link_repid        =
*     shellstyle        =
*     left              =
*     top               =
*     width             =
*     height            =
*     metric            = CNTL_METRIC_DYNPRO
*     align             = 15
      parent            = go_cust
      rows              = 2
      columns           = 2
*     no_autodef_progid_dynnr =
*     name              =
    EXCEPTIONS
      cntl_error        = 1
      cntl_system_error = 2
      OTHERS            = 3.
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
               WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.

  CALL METHOD go_splitter->get_container
    EXPORTING
      row       = 1
      column    = 1
    RECEIVING
      container = go_gui1.

  CALL METHOD go_splitter->get_container
    EXPORTING
      row       = 2
      column    = 2
    RECEIVING
      container = go_gui2.


  CALL METHOD go_splitter->get_container
  EXPORTING
    row       = 1
    column    = 2
    RECEIVING
    container = go_gui3.

  CREATE OBJECT go_alv
    EXPORTING
      i_parent = go_gui1.
*        i_parent = cl_gui_container=>screen0.

  CREATE OBJECT go_alv2
    EXPORTING
      i_parent = go_gui2.

  CREATE OBJECT go_alv3
  EXPORTING
    i_parent = go_gui3.

  CALL METHOD go_alv->set_table_for_first_display
    EXPORTING
      is_layout                     = gs_layout
    CHANGING
      it_outtab                     = gt_scarr
      it_fieldcatalog               = gt_fcat
    EXCEPTIONS
      invalid_parameter_combination = 1
      program_error                 = 2
      too_many_lines                = 3
      OTHERS                        = 4.

  CALL METHOD go_alv2->set_table_for_first_display
  EXPORTING
    is_layout                     = gs_layout
  CHANGING
    it_outtab                     = gt_sflight
    it_fieldcatalog               = gt_fcat2
  EXCEPTIONS
    invalid_parameter_combination = 1
    program_error                 = 2
    too_many_lines                = 3
    OTHERS                        = 4.

  CALL METHOD go_alv3->set_table_for_first_display
  EXPORTING
    is_layout                     = gs_layout
  CHANGING
    it_outtab                     = gt_sflight
    it_fieldcatalog               = gt_fcat2
  EXCEPTIONS
    invalid_parameter_combination = 1
    program_error                 = 2
    too_many_lines                = 3
    OTHERS                        = 4.

*  IF go_alv IS INITIAL.
*
*    CREATE OBJECT go_cust
*    EXPORTING
*      container_name              = 'CC_ALV'.
*
*    CREATE OBJECT go_cust2
*    EXPORTING
*      container_name              = 'CC_ALV2'.
*
*    CREATE OBJECT go_alv
*      EXPORTING
*       i_parent = go_cust.
**        i_parent = cl_gui_container=>screen0.
*
*    CREATE OBJECT go_alv2
*    EXPORTING
*      i_parent = go_cust2.
**        i_parent = cl_gui_container=>screen0.
*
*    CALL METHOD go_alv->set_table_for_first_display
*      EXPORTING
*        is_layout                     = gs_layout
*      CHANGING
*        it_outtab                     = gt_scarr
*        it_fieldcatalog               = gt_fcat
*      EXCEPTIONS
*        invalid_parameter_combination = 1
*        program_error                 = 2
*        too_many_lines                = 3
*        OTHERS                        = 4.
*
*
*
*    CALL METHOD go_alv2->set_table_for_first_display
*    EXPORTING
*      is_layout                     = gs_layout
*    CHANGING
*      it_outtab                     = gt_sflight
*      it_fieldcatalog               = gt_fcat2
*    EXCEPTIONS
*      invalid_parameter_combination = 1
*      program_error                 = 2
*      too_many_lines                = 3
*      OTHERS                        = 4.
*
*
*
*    CALL METHOD go_alv->register_edit_event
*      EXPORTING
*        i_event_id = cl_gui_alv_grid=>mc_evt_enter
*      EXCEPTIONS
*        error      = 1
*        OTHERS     = 2.
*    IF sy-subrc <> 0.
*      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
*      WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
*    ENDIF.
*
**CALL METHOD go_alv->register_edit_event
**EXPORTING
**    i_event_id = cl_gui_alv_grid=>mc_evt_modified
**  EXCEPTIONS
**    error      = 1
**    others     = 2
**  .
**IF sy-subrc <> 0.
** MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
**            WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
**ENDIF.
*
*  ELSE.
*    CALL METHOD go_alv->refresh_table_display.
*    CALL METHOD go_alv2->refresh_table_display.
*  ENDIF.

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

  SELECT * FROM sflight
    INTO CORRESPONDING FIELDS OF TABLE gt_sflight.
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

  CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
    EXPORTING
      i_structure_name = 'SFLIGHT'
    CHANGING
      ct_fieldcat      = gt_fcat2.
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
