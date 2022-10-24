*&---------------------------------------------------------------------*
*&  Include           ZHSN_EGT_0033_CLS
*&---------------------------------------------------------------------*

CLASS: cl_event_receiver DEFINITION.
  PUBLIC SECTION.
    METHODS handle_top_of_page              "TOP_OF_PAGE
        FOR EVENT top_of_page OF cl_gui_alv_grid
      IMPORTING
        e_dyndoc_id
        table_index.

    METHODS handle_hotspot_click             "HOTSPOT_CLICK
        FOR EVENT hotspot_click OF cl_gui_alv_grid
      IMPORTING
        e_row_id
        e_column_id.

    METHODS handle_double_click              "DOUBLE_CLICK
        FOR EVENT double_click OF cl_gui_alv_grid
      IMPORTING
        e_row
        e_column
        es_row_no.

    METHODS handle_data_changed              "DATA_CHANGED
        FOR EVENT data_changed OF cl_gui_alv_grid
      IMPORTING
        er_data_changed
        e_onf4
        e_onf4_before
        e_onf4_after
        e_ucomm.

    METHODS handle_onf4              "ONF4
        FOR EVENT onf4 OF cl_gui_alv_grid
      IMPORTING
        e_fieldname
        e_fieldvalue
        es_row_no
        er_event_data
        et_bad_cells
        e_display.
ENDCLASS.

CLASS: cl_event_receiver IMPLEMENTATION.
  METHOD handle_top_of_page.
    DATA: lv_text TYPE sdydo_text_element.

    lv_text = 'FLIGHT DETAILS'.

    CALL METHOD go_docu->add_text
      EXPORTING
        text      = lv_text
        sap_style = cl_dd_document=>heading.

    CALL METHOD go_docu->new_line.

    CLEAR: lv_text.

    CONCATENATE 'User: ' sy-uname INTO lv_text SEPARATED BY space.

    CALL METHOD go_docu->add_text
      EXPORTING
        text         = lv_text
        sap_color    = cl_dd_document=>list_positive
        sap_fontsize = cl_dd_document=>medium.

    CALL METHOD go_docu->display_document
      EXPORTING
        parent             = go_sub1
      EXCEPTIONS
        html_display_error = 1
        OTHERS             = 2.
    IF sy-subrc <> 0.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
                 WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ENDIF.
  ENDMETHOD.        "handle_top_of_page

  METHOD handle_hotspot_click .
    BREAK-POINT.
  ENDMETHOD.        "handle_hotspot_click

  METHOD handle_double_click.
    BREAK-POINT.
  ENDMETHOD.        "handle_double_click

  METHOD handle_data_changed.
    BREAK-POINT.
  ENDMETHOD.        "handle_data_changed

  METHOD handle_onf4.
    BREAK-POINT.
  ENDMETHOD.        "handle_onf4
ENDCLASS.
