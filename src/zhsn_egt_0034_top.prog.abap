*&---------------------------------------------------------------------*
*&  Include           ZHSN_EGT_0034_TOP
*&---------------------------------------------------------------------*
DATA: go_grid  TYPE REF TO cl_gui_alv_grid,
      go_cust TYPE REF TO cl_gui_custom_container.


DATA: gt_scarr   TYPE TABLE OF scarr,
      gs_scarr   TYPE scarr,
      gt_sflight TYPE TABLE OF sflight,
      gt_fcat    TYPE lvc_t_fcat,
      gs_fcat    TYPE lvc_s_fcat,
      gs_layout  TYPE lvc_s_layo.

FIELD-SYMBOLS: <gfs_fcat> TYPE lvc_s_fcat.


CLASS: cl_event_receiver DEFINITION DEFERRED.
DATA: go_event_receiver TYPE REF TO cl_event_receiver.
