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
    DATA: ls_modi TYPE lvc_s_modi,
          lv_mess TYPE char200.
    LOOP AT er_data_changed->mt_good_cells INTO ls_modi.
      READ TABLE gt_scarr INTO gs_scarr INDEX ls_modi-row_id.
      IF sy-subrc EQ 0.
        CASE ls_modi-fieldname.
          WHEN 'CARRNAME'.
            CONCATENATE ls_modi-fieldname
                        '=> eski değer'
                        gs_scarr-carrname
                        ', yeni değer'
                        ls_modi-value
                        INTO lv_mess
                        SEPARATED BY space.
          WHEN 'URL'.
            CONCATENATE ls_modi-fieldname
                        '=> eski değer'
                        gs_scarr-url
                        ', yeni değer'
                        ls_modi-value
                        INTO lv_mess
                        SEPARATED BY space.
        ENDCASE.
        MESSAGE lv_mess TYPE 'I'.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.        "handle_data_changed

  METHOD handle_onf4.
    BREAK-POINT.
  ENDMETHOD.        "handle_onf4
ENDCLASS.
