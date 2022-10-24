*&---------------------------------------------------------------------*
*&  Include           ZHSN_EGT_0033_TOP
*&---------------------------------------------------------------------*

DATA: go_grid TYPE REF TO cl_gui_alv_grid,
      go_cust TYPE REF TO cl_gui_custom_container.

DATA: gt_scarr  TYPE TABLE OF scarr,
      gt_fcat   TYPE lvc_t_fcat,
      gs_fcat   TYPE lvc_s_fcat,
      gs_layout TYPE lvc_s_layo.

DATA: go_spli TYPE REF TO cl_gui_splitter_container,
      go_sub1 TYPE REF TO cl_gui_container,
      go_sub2 TYPE REF TO cl_gui_container.

DATA: go_docu TYPE REF TO cl_dd_document.

CLASS: cl_event_receiver DEFINITION DEFERRED.
DATA: go_event_recevier TYPE REF TO cl_event_receiver.
