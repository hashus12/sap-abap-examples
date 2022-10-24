*&---------------------------------------------------------------------*
*&  Include           ZHSN_EGT_0030_TOP
*&---------------------------------------------------------------------*

"iconlara erişmek için
TYPE-POOLS icon.

DATA: go_alv  TYPE REF TO cl_gui_alv_grid,
      go_cont TYPE REF TO cl_gui_custom_container.

DATA: gs_cell_color TYPE lvc_s_scol.

TYPES: BEGIN OF gty_scarr,
         durum     TYPE icon_d, "icon data element, icon tablosuda var.
         carrid    TYPE s_carr_id,
         carrname  TYPE s_carrname,
         currcode  TYPE s_currcode,
         url       TYPE s_carrurl,
*         mess       TYPE char200,
*         line_color TYPE char4,
*         cell_color TYPE lvc_t_scol,
         cost      TYPE int4,
         location  TYPE char20,  "dropdown
         seatl     TYPE char1,
         seatp     TYPE char10,
         dd_handle TYPE int4,
       END OF gty_scarr.


DATA: gt_scarr  TYPE TABLE OF gty_scarr,
      gs_scarr  TYPE gty_scarr,
      gt_fcat   TYPE lvc_t_fcat,
      gs_fcat   TYPE lvc_s_fcat,
      gs_layout TYPE lvc_s_layo.

FIELD-SYMBOLS: <gfs_fc>    TYPE lvc_s_fcat,
               <gfs_scarr> TYPE gty_scarr.
