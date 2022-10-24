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

    METHODS handle_onf4                      "ONF4
        FOR EVENT onf4 OF cl_gui_alv_grid
      IMPORTING
        e_fieldname
        e_fieldvalue
        es_row_no
        er_event_data
        et_bad_cells
        e_display.

    METHODS handle_toolbar                   "TOOLBAR
        FOR EVENT toolbar OF cl_gui_alv_grid
      IMPORTING
        e_object
        e_interactive.

    METHODS handle_user_command              "USER_COMMAND
        FOR EVENT user_command OF cl_gui_alv_grid
      IMPORTING
        e_ucomm.
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
    BREAK-POINT.
  ENDMETHOD.        "handle_onf4

  METHOD handle_toolbar.
    DATA: ls_toolbar TYPE stb_button.

    CLEAR: ls_toolbar.
    ls_toolbar-function = '&DEL'.
    ls_toolbar-text = 'Silme'.
    ls_toolbar-icon = '@11@'.
    ls_toolbar-quickinfo = 'Silme işlemi'.
    ls_toolbar-disabled = abap_false.
    APPEND ls_toolbar TO e_object->mt_toolbar.

    CLEAR: ls_toolbar.
    ls_toolbar-function = '&DIS'.
    ls_toolbar-text = 'Görüntüle'.
    ls_toolbar-icon = '@10@'.
    ls_toolbar-quickinfo = 'Görüntüleme işlemi'.
    ls_toolbar-disabled = abap_false.
    APPEND ls_toolbar TO e_object->mt_toolbar.
  ENDMETHOD.        "handle_toolbar

  METHOD handle_user_command.
    CASE e_ucomm.
      WHEN '&DEL'.
        MESSAGE 'Silme İşlemi' TYPE 'I'.
      WHEN '&DIS'.
        MESSAGE 'Görüntüleme İşlemi' TYPE 'I'.
    ENDCASE.
  ENDMETHOD.        "handle_user_command
ENDCLASS.
