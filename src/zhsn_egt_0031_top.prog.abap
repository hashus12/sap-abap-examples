*&---------------------------------------------------------------------*
*&  Include           ZHSN_EGT_0031_TOP
*&---------------------------------------------------------------------*

DATA: go_alv  TYPE REF TO cl_gui_alv_grid,
      go_cont TYPE REF TO cl_gui_custom_container.


TYPES: BEGIN OF gty_scarr,
         durum     TYPE icon_d, "icon data element, icon tablosuda var.
         carrid    TYPE s_carr_id,
         carrname  TYPE s_carrname,
         currcode  TYPE s_currcode,
         url       TYPE s_carrurl,
         cellstyle TYPE lvc_t_styl,
         styleval  TYPE char8,
       END OF gty_scarr.

DATA: gs_cellstyle TYPE lvc_s_styl.

DATA: gt_scarr  TYPE TABLE OF gty_scarr,
      gs_scarr  TYPE gty_scarr,
      gt_fcat   TYPE lvc_t_fcat,
      gs_fcat   TYPE lvc_s_fcat,
      gs_layout TYPE lvc_s_layo.


FIELD-SYMBOLS: <gfs_fc>    TYPE lvc_s_fcat,
               <gfs_scarr> TYPE gty_scarr.
