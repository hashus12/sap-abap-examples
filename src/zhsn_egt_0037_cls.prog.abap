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
    BREAK-POINT.
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
    TYPES: BEGIN OF lty_value_tab,
             carrname TYPE s_carrname,
             carrdeff TYPE char20,
           END OF lty_value_tab.

    DATA: lt_value_tab TYPE TABLE OF lty_value_tab,
          ls_value_tab TYPE lty_value_tab.

    DATA: lt_return_tab TYPE TABLE OF ddshretval,
          ls_return_tab TYPE ddshretval.

    CLEAR: ls_value_tab.
    ls_value_tab-carrname = 'Uçuş 1'.
    ls_value_tab-carrdeff = 'Birinci Uçuş'.
    APPEND ls_value_tab TO lt_value_tab.
    CLEAR: ls_value_tab.
    ls_value_tab-carrname = 'Uçuş 2'.
    ls_value_tab-carrdeff = 'İkinci Uçuş'.
    APPEND ls_value_tab TO lt_value_tab.
    CLEAR: ls_value_tab.
    ls_value_tab-carrname = 'Uçuş 3'.
    ls_value_tab-carrdeff = 'Üçüncü Uçuş'.
    APPEND ls_value_tab TO lt_value_tab.

    CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
      EXPORTING
        retfield        = 'CARRNAME'
        window_title    = 'Carrname F4'
        value_org       = 'S'
      TABLES
        value_tab       = lt_value_tab
        return_tab      = lt_return_tab
      EXCEPTIONS
        parameter_error = 1
        no_values_found = 2
        OTHERS          = 3.
    IF sy-subrc <> 0.
* Implement suitable error handling here
    ENDIF.

    READ TABLE lt_return_tab INTO ls_return_tab WITH KEY fieldname = 'F0001'.
    IF sy-subrc EQ 0.
      READ TABLE gt_scarr ASSIGNING <gfs_scarr> INDEX es_row_no-row_id.
      IF sy-subrc EQ 0.
        <gfs_scarr>-carrname = ls_return_tab-fieldval.

        go_grid->refresh_table_display(
          EXCEPTIONS
            finished       = 1
            OTHERS         = 2
            ).
        IF sy-subrc <> 0.
          MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
                     WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
        ENDIF.
      ENDIF.
    ENDIF.

    er_event_data->m_event_handled = 'X'.
  ENDMETHOD.        "handle_onf4
ENDCLASS.
