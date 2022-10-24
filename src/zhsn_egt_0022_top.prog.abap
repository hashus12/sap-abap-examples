*&---------------------------------------------------------------------*
*&  Include           ZHSN_EGT_0022_TOP
*&---------------------------------------------------------------------*

"
DATA: BEGIN OF gt_list OCCURS 0,
        selkz      TYPE char1,
        ebeln      LIKE ekko-ebeln,
        ebelp      LIKE ekpo-ebelp,
        bstyp      LIKE ekko-bstyp,
        bsart      LIKE ekko-bsart,
        matnr      LIKE ekpo-matnr,
        menge      LIKE ekpo-menge,
        meins      LIKE ekpo-meins,
        line_color TYPE char4,
        cell_color TYPE slis_t_specialcol_alv,
      END OF gt_list.

*gty-global type
TYPES: BEGIN OF gty_list,
         selkz      TYPE char1,
         ebeln      TYPE ebeln,
         ebelp      TYPE ebelp,
         bstyp      TYPE ebstyp,
         bsart      TYPE esart,
         matnr      TYPE matnr,
         menge      TYPE bstmg,
         meins      TYPE meins,
         line_color TYPE char4,
         cell_color TYPE slis_t_specialcol_alv,
       END OF gty_list.

DATA: gs_cell_color TYPE slis_specialcol_alv.

DATA: gt_list2 TYPE TABLE OF gty_list,
      gs_list  TYPE gty_list.

DATA: gt_fieldcatalog TYPE slis_t_fieldcat_alv,
      gs_fieldcatalog TYPE slis_fieldcat_alv.

DATA: gs_layout TYPE slis_layout_alv.

DATA: gt_events TYPE slis_t_event,
      gs_event  TYPE slis_alv_event.

DATA: gt_exclude TYPE slis_t_extab,
      gs_exclude TYPE slis_extab.

DATA: gt_sort TYPE slis_t_sortinfo_alv,
      gs_sort TYPE slis_filter_alv.

DATA: gt_filter TYPE slis_t_filter_alv,
      gs_filter TYPE slis_filter_alv.

DATA: gs_variant TYPE disvariant.

DATA: gs_variant_get TYPE disvariant,
      gv_exit        TYPE char1.
PARAMETERS: p_vari TYPE disvariant-variant.
