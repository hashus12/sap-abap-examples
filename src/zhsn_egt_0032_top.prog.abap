*&---------------------------------------------------------------------*
*&  Include           ZHSN_EGT_0032_TOP
*&---------------------------------------------------------------------*
DATA: go_alv  TYPE REF TO cl_gui_alv_grid,
      go_alv2  TYPE REF TO cl_gui_alv_grid,
      go_alv3  TYPE REF TO cl_gui_alv_grid,
      go_cust TYPE REF TO cl_gui_custom_container.

DATA: go_splitter TYPE REF TO cl_gui_splitter_container,
      go_gui1     TYPE REF TO cl_gui_container,
      go_gui2     TYPE REF TO cl_gui_container,
      go_gui3     TYPE REF TO cl_gui_container.
*
*DATA: go_alv2  TYPE REF TO cl_gui_alv_grid,
*      go_cust2 TYPE REF TO cl_gui_custom_container.

DATA: gt_scarr   TYPE TABLE OF scarr,
      gt_sflight TYPE TABLE OF sflight,
      gt_fcat    TYPE lvc_t_fcat,
      gt_fcat2   TYPE lvc_t_fcat,
      gs_fcat    TYPE lvc_s_fcat,
      gs_layout  TYPE lvc_s_layo.
