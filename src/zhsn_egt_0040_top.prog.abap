*&---------------------------------------------------------------------*
*&  Include           ZHSN_EGT_0032_TOP
*&---------------------------------------------------------------------*
DATA: go_grid TYPE REF TO cl_gui_alv_grid,
      go_cust TYPE REF TO cl_gui_custom_container.

CLASS: cl_event_receiver DEFINITION DEFERRED.
DATA: go_event_receiver TYPE REF TO cl_event_receiver.

DATA: gt_scarr   TYPE TABLE OF scarr,
      gt_sflight TYPE TABLE OF sflight,
      gt_fcat    TYPE lvc_t_fcat,
      gs_fcat    TYPE lvc_s_fcat,
      gs_layout  TYPE lvc_s_layo.

DATA: gt_exluding TYPE ui_functions,
      gv_exluding TYPE ui_func,
      gt_sort     TYPE lvc_t_sort,
      gt_filter   TYPE lvc_t_filt,
      gs_sort     TYPE lvc_s_sort,
      gs_filter   TYPE lvc_s_filt.
