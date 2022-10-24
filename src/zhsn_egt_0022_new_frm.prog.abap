*&---------------------------------------------------------------------*
*&  Include           ZHSN_EGT_0022_NEW_FRM
*&---------------------------------------------------------------------*
FORM get_data .

  "Tilde ~ kullanılıyor tire - değil.
  "kolonları eşitlemek için corresponding kullanabilirdik ancak yukardaki şekilde daha performanslı.
  SELECT
  ekko~ebeln
  ekpo~ebelp
  ekko~bstyp
  ekko~bsart
  ekpo~matnr
  ekpo~menge
  ekpo~meins
  UP TO 100 ROWS
  FROM ekko
  JOIN ekpo
  ON ekpo~ebeln EQ ekko~ebeln
  INTO CORRESPONDING FIELDS OF TABLE gt_list.
  "corresponding select kolonlarıyla internal tabledaki alanları eşleştiriyor.

  "gs_list-line_color 4 karakterli alan giriyoruz. c:color demek, col:renk değeri, int:koyuluk değeri, inv: font color mı backround color mı.
  "bir satırda veri değişikliği yaptıktan sonra internal tablı güncellemesi için modify kullanıyoruz.
  LOOP AT gt_list INTO gs_list.
    IF gs_list-ebelp EQ '1'.
      CLEAR: gs_cell_color.
      gs_cell_color-fieldname = 'MATNR'.
      gs_cell_color-color-col = 5.
      gs_cell_color-color-int = 1.
      gs_cell_color-color-inv = 0.
      APPEND gs_cell_color TO gs_list-cell_color.
      MODIFY gt_list FROM gs_list.

      CLEAR: gs_cell_color.
      gs_cell_color-fieldname = 'EBELP'.
      gs_cell_color-color-col = 7.
      gs_cell_color-color-int = 1.
      gs_cell_color-color-inv = 0.
      APPEND gs_cell_color TO gs_list-cell_color.
      MODIFY gt_list FROM gs_list.
    ENDIF.
*    IF gs_list-ebelp EQ '2'.
*      CLEAR: gs_cell_color.
*      gs_cell_color-fieldname = 'BSTYP'.
*      gs_cell_color-COLOR-col = 6.
*      gs_cell_color-COLOR-int = 1.
*      gs_cell_color-COLOR-inv = 0.
*      APPEND gs_cell_color TO gs_list-cell_color.
*      MODIFY gt_list FROM gs_list.
*    ENDIF.
*    IF gs_list-ebelp eq '1'.
*      gs_list-line_color = 'C301'.
*      MODIFY gt_list FROM gs_list.
    IF gs_list-ebelp EQ '2'.
      gs_list-line_color = 'C710'.
      MODIFY gt_list FROM gs_list.
*    ELSEIF gs_list-ebelp EQ '4'.
*      gs_list-line_color = 'C600'.
*      MODIFY gt_list FROM gs_list.
    ENDIF.
  ENDLOOP.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  SET_FC
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
"REUSE_ALV_FIELDCATALOG_MERGE 'ın internal table'ı headerline'lı bir internal table isteyen bir yapı. Header linelı yapı hem içerisinde structure barındıran hemde içerisinde bie internal table gibi davranan yapı
"ikisi bir arada olduğu için clear yada refreshlerde problem yaşayabiliyoruz bu yüzden ya structure ya da internal tableı bağımsız tanımlıyoruz ama bu yapı böyle itediğinden şimdilik kullanıyoruz include top da tanıma bakabilirsin.
"Burdaki structure database seviyesinde oluşturduğumuz structure
FORM set_fc .
*  CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE'
*    EXPORTING
*      i_program_name     = sy-repid
*      i_internal_tabname = 'GT_LIST'
*      i_structure_name   = 'ZBK_EGT_0022_S'
*      i_inclname         = sy-repid
*    CHANGING
*      ct_fieldcat        = gt_fieldcatalog.

  CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
    EXPORTING
      i_structure_name = 'ZBK_EGT_0022_S'
*     I_CLIENT_NEVER_DISPLAY       = 'X'
*     I_INTERNAL_TABNAME           =
    CHANGING
      ct_fieldcat      = gt_fieldcatalog.



*
*  PERFORM: set_fc_sub USING 'EBELN' 'Sas NO' 'SAS Numarası' 'SAS Numarası' abap_true '0' '' 'X',
*           set_fc_sub USING 'EBELP' 'Kalem' 'Kalem' 'Kalem' 'X' '1' '' '',
*           set_fc_sub USING 'BSTYP' 'Belge tipi' 'Belge tipi' 'Belge tipi' '' '2' '' '',
*           set_fc_sub USING 'BSART' 'Belge türü' 'Belge türü' 'Belge türü' '' '3' '' '',
*           set_fc_sub USING 'MATNR' 'Malzeme' 'Malzeme' 'Malzeme' '' '4' '' 'X',
*           set_fc_sub USING 'MENGE' 'Miktar' 'Miktar' 'Miktar' '' '5' 'X' '',
*           set_fc_sub USING 'MEINS' 'ÖB' 'Ölçü Birimi' 'Ölçü Birimi' '' '6' '' ''.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  SET_FC_SUB
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*

"gt_list tableın kolonlarını, field katalog tableın field name kolonuna itemları olarak eklicez.
FORM set_fc_sub USING p_fieldname
      p_seltext_s
      p_seltext_m
      p_seltext_l
      p_key
      p_col_pos
      p_do_sum
      p_hotspot.
  CLEAR: gs_fieldcatalog.
  gs_fieldcatalog-fieldname = p_fieldname.
  gs_fieldcatalog-scrtext_s = p_seltext_s.
  gs_fieldcatalog-scrtext_m = p_seltext_m.
  gs_fieldcatalog-scrtext_l = p_seltext_l.
  gs_fieldcatalog-key       = p_key.
  gs_fieldcatalog-col_pos   = p_col_pos.
  gs_fieldcatalog-do_sum    = p_do_sum.
  gs_fieldcatalog-hotspot   = p_hotspot.
  APPEND gs_fieldcatalog TO gt_fieldcatalog.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  SET_LAYOUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM set_layout .
  gs_layout-grid_title = 'REUSE ALV EĞİTİM VİDEOSU SERİSİ'.
  gs_layout-zebra             = abap_true.
  gs_layout-cwidth_opt = abap_true.
  gs_layout-box_fname     = 'SELKZ'.     "Satır seçimi ni yönetmesi için kullandık.
  gs_layout-info_fname    = 'LINE_COLOR'. "alv de kullandığım line color alanı satır renklendirmesi için kullanacağım alan demek oldu.,
  gs_layout-ctab_fname  = 'CELL_COLOR'.
**  gs_layout-EDIT              = abap_true.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  DISPLAY_ALV
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM display_alv .
  "name'e event id si forma da oluşturduğumuz formun adı.
  gs_event-name = slis_ev_top_of_page.
  gs_event-form = 'TOP_OF_PAGE'.
  APPEND gs_event TO gt_events.
  gs_event-name = slis_ev_end_of_list .
  gs_event-form = 'END_OF_LIST'.
  APPEND gs_event TO gt_events.
*  gs_event-name = slis_ev_pf_status_set .
*  gs_event-form = 'PF_STATUS_SET'.
*  APPEND gs_event TO gt_events.

*  gs_exclude-fcode = '&UMC'.    "butona sol tıkla basılı tutup f1 basıp sol tıkı bırakırsak teknik bilgi ekranı geliyor  butonun fcodunu gösteriyor.
*  APPEND gs_exclude TO gt_exclude.
*  gs_exclude-fcode = '&INFO'.
*  APPEND gs_exclude TO gt_exclude.
*
*  gs_sort-spos      = 1.         "Öncelik belirtiyoruz önce bu kolon sıralınıyor sonra buna bağlı olarak alttaki 2. kolon.
*  gs_sort-tabname   = 'GT_LIST'.
*  gs_sort-fieldname = 'BSART'.
*  gs_sort-down      = abap_true.
*  APPEND gs_sort TO gt_sort.
*
*  gs_sort-spos      = 2.
*  gs_sort-tabname   = 'GT_LIST'.
*  gs_sort-fieldname = 'MENGE'.
*  gs_sort-up      = abap_true.
*  APPEND gs_sort TO gt_sort.
*
*  gs_filter-tabname   = 'GT_LIST'.
*  gs_filter-fieldname = 'EBELP'.
*  gs_filter-sign0     = 'I'.      "include mu exclude mı. koşula dahil olan mı gelsin yoksa dışında kalanlar mı gelsin.
*  gs_filter-optio     = 'EQ'.     "Select optionsun arka planda doldurulmuş hali aslında
*  gs_filter-valuf_int = '2'.
*  APPEND gs_filter TO gt_filter.
*
*  gs_filter-tabname   = 'GT_LIST'.
*  gs_filter-fieldname = 'MEINS'.
*  gs_filter-sign0     = 'I'.
*  gs_filter-optio     = 'EQ'.
*  gs_filter-valuf_int = 'ST'.
*  APPEND gs_filter TO gt_filter.

  "save bu rapordaki düzenlemeyi sürekli tekrar yapmamak için bu düzenlemeyi kayıt edebiliyoruz. Var olan düzeni Variant diye tanımlıyoruz.
*I_SAVE = ' ' ----> Display variants cannot be saved
*I_SAVE = 'X' ----> Standard save mode
*I_SAVE = 'U' ----> User-Specified save mode
*I_SAVE = 'A' ----> Standard and user-specified save mode

  "Genel kullanım: Giriş ekranına bir variant parametresi tanımlanır rapor çalışmadan kullanıcı isterse kendisinin bir tanesini seçmesi olanak sağlanır.
  gs_variant-variant = p_vari.

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY_LVC'
    EXPORTING
*     I_INTERFACE_CHECK        = ' '
      i_bypassing_buffer       = abap_true
      i_buffer_active          = abap_false
      i_callback_program       = sy-repid
      i_callback_pf_status_set = 'PF_STATUS_SET'
      i_callback_user_command  = 'USER_COMMAND'
      i_callback_top_of_page   = 'TOP_OF_PAGE'
*     I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*     I_CALLBACK_HTML_END_OF_LIST       = ' '
*     I_STRUCTURE_NAME         =
*     I_BACKGROUND_ID          = ' '
*     I_GRID_TITLE             =
*     I_GRID_SETTINGS          =
      is_layout_lvc            = gs_layout
      it_fieldcat_lvc          = gt_fieldcatalog
      it_excluding             = gt_exclude
*     IT_SPECIAL_GROUPS_LVC    =
      it_sort_lvc              = gt_sort
      it_filter_lvc            = gt_filter
*     IT_HYPERLINK             =
*     IS_SEL_HIDE              =
      i_default                = ''
      i_save                   = 'U'
      is_variant               = gs_variant
      it_events                = gt_events
*     IT_EVENT_EXIT            =
*     IS_PRINT_LVC             =
*     IS_REPREP_ID_LVC         =
*     I_SCREEN_START_COLUMN    = 0
*     I_SCREEN_START_LINE      = 0
*     I_SCREEN_END_COLUMN      = 0
*     I_SCREEN_END_LINE        = 0
*     I_HTML_HEIGHT_TOP        =
*     I_HTML_HEIGHT_END        =
*     IT_ALV_GRAPHICS          =
*     IT_EXCEPT_QINFO_LVC      =
*     IR_SALV_FULLSCREEN_ADAPTER        =
* IMPORTING
*     E_EXIT_CAUSED_BY_CALLER  =
*     ES_EXIT_CAUSED_BY_USER   =
    TABLES
      t_outtab                 = gt_list
    EXCEPTIONS
      program_error            = 1
      OTHERS                   = 2.
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.


*  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
*    EXPORTING
**     I_INTERFACE_CHECK       = ' '
**     I_BYPASSING_BUFFER      = ' '
**     I_BUFFER_ACTIVE         = ' '
*      i_callback_program      = sy-repid        "gt_events te alttaki callback yapıları da burdan referans alıyor.
**     i_callback_pf_status_set = 'PF_STATUS_SET'
*      i_callback_user_command = 'USER_COMMAND'
**     I_CALLBACK_TOP_OF_PAGE  = 'TOP_OF_PAGE'   "form ismi.
**     I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
**     I_CALLBACK_HTML_END_OF_LIST       = ' '
**     I_STRUCTURE_NAME        =
**     I_BACKGROUND_ID         = ' '
**     I_GRID_TITLE            =
**     I_GRID_SETTINGS         =
*      is_layout               = gs_layout
*      it_fieldcat             = gt_fieldcatalog
*      it_excluding            = gt_exclude      "default toolbardaki butonları kaldırmamıza gizlememize yarayan yapı.
**     IT_SPECIAL_GROUPS       =
*      it_sort                 = gt_sort
*      it_filter               = gt_filter
**     IS_SEL_HIDE             =
*      i_default               = ''             "ön ayarlı varianttan etkilensin mi etkilenmesin mi.
*      i_save                  = 'A'
**     IS_VARIANT              = gs_variant
*      it_events               = gt_events
**     IT_EVENT_EXIT           =
**     IS_PRINT                =
**     IS_REPREP_ID            =
**     i_screen_start_column   = 40               "ALV pop-up bir screen olarak kendini göstericek.
**     i_screen_start_line     = 5
**     i_screen_end_column     = 100
**     i_screen_end_line       = 20
**     I_HTML_HEIGHT_TOP       = 0
**     I_HTML_HEIGHT_END       = 0
**     IT_ALV_GRAPHICS         =
**     IT_HYPERLINK            =
**     IT_ADD_FIELDCAT         =
**     IT_EXCEPT_QINFO         =
**     IR_SALV_FULLSCREEN_ADAPTER        =
** IMPORTING
**     E_EXIT_CAUSED_BY_CALLER =
**     ES_EXIT_CAUSED_BY_USER  =
*    TABLES
*      t_outtab                = gt_list
** EXCEPTIONS
**     PROGRAM_ERROR           = 1
**     OTHERS                  = 2
*    .
*  IF sy-subrc <> 0.
** Implement suitable error handling here
*  ENDIF.



ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  TOP_OF_PAGE
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM top_of_page .
  DATA: lt_header TYPE slis_t_listheader,
        ls_header TYPE slis_listheader.
  DATA: lv_date TYPE char10.
  DATA: lv_lines   TYPE i,
        lv_lines_c TYPE char4.

  CLEAR: ls_header.
  ls_header-typ = 'H'.
  ls_header-info = 'Satınalma Sipariş Raporu'.
  APPEND ls_header TO lt_header.

  CLEAR: ls_header.
  ls_header-typ = 'S'.
  ls_header-key = 'Tarih:'.
*  ls_header-info = '16.05.2021'.
  CONCATENATE sy-datum+6(2)
  '.'
  sy-datum+4(2)
  '.'
  sy-datum+0(4)
  INTO lv_date.
  ls_header-info = lv_date.
  APPEND ls_header TO lt_header.
*  sy-datum = '20220821'.


*  CLEAR: ls_header.
*  DESCRIBE TABLE gt_list LINES lv_lines.
*  lv_lines_c = lv_lines.
*  ls_header-typ = 'A'.
**  ls_header-info = ''.
*  CONCATENATE 'Raporda'
*              lv_lines_c
*              'adet kalem vardır.'
*              INTO ls_header-info
*              SEPARATED BY space.
*  APPEND ls_header TO lt_header.


  CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
    EXPORTING
      it_list_commentary = lt_header.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  END_OF_PAGE
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM end_of_list .
  DATA: lt_header TYPE slis_t_listheader,
        ls_header TYPE slis_listheader.
  DATA: lv_date TYPE char10.
  DATA: lv_lines   TYPE i,
        lv_lines_c TYPE char4.
*
*  CLEAR: ls_header.
*  ls_header-typ = 'H'.
*  ls_header-info = 'Satınalma Sipariş Raporu'.
*  APPEND ls_header TO lt_header.
*
*  CLEAR: ls_header.
*  ls_header-typ = 'S'.
*  ls_header-key = 'Tarih:'.
**  ls_header-info = '16.05.2021'.
*  CONCATENATE sy-datum+6(2)
*  '.'
*  sy-datum+4(2)
*  '.'
*  sy-datum+0(4)
*  INTO lv_date.
*  ls_header-info = lv_date.
*  APPEND ls_header TO lt_header.
**  sy-datum = '20220821'.


  CLEAR: ls_header.
  DESCRIBE TABLE gt_list LINES lv_lines.
  lv_lines_c = lv_lines.
  ls_header-typ = 'A'.
*  ls_header-info = ''.
  CONCATENATE 'Raporda'
  lv_lines_c
  'adet kalem vardır.'
  INTO ls_header-info
  SEPARATED BY space.
  APPEND ls_header TO lt_header.


  CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
    EXPORTING
      it_list_commentary = lt_header.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  PF_STATUS_SET
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
"SAPLSALV programına girip function grup altındaki gui statusün altında standart(STANDARD) ve pop-up(STDPOPUP) ekranlar için yapılmış default örnekler var.
"Gui status kopyalama ile yaptık.
FORM pf_status_set USING p_extab TYPE slis_t_extab.
  SET PF-STATUS '0200'.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  USER_COMMAND
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM user_command USING p_ucomm     TYPE sy-ucomm
      ps_selfield TYPE slis_selfield. "kolon row bilgisini dönen yapı hangi satırın double click yada hotspot active olduğunu anlamak için.
  DATA: lv_mes TYPE char200,
        lv_ind TYPE numc2.

  CASE p_ucomm.
    WHEN '&MSG'.
      LOOP AT gt_list INTO gs_list WHERE selkz EQ 'X'.
        lv_ind = lv_ind + 1.
      ENDLOOP.
      CONCATENATE lv_ind
      'sayı kadar satır seçilmiştir.'
      INTO lv_mes
      SEPARATED BY space.
      MESSAGE lv_mes TYPE 'I'.
    WHEN '&IC1'.
      CASE ps_selfield-fieldname.
        WHEN 'EBELN'.
          CONCATENATE ps_selfield-value
          'numaralı SAS tıklanmıştır.'
          INTO lv_mes
          SEPARATED BY space.
          MESSAGE lv_mes TYPE 'I'.
        WHEN 'MATNR'.
          CONCATENATE ps_selfield-value
          'numaralı malzeme tıklanmıştır.'
          INTO lv_mes
          SEPARATED BY space.
          MESSAGE lv_mes TYPE 'I'.
      ENDCASE.
*      MESSAGE 'Çift tıklandı.' TYPE 'I'. "bir kolona çift tıklandığında ya da hotspot(tek tıkla çift tıklama özelliği gibi düşünebilirsin) &IC1 fonc code tetiklenir.
  ENDCASE.
ENDFORM.
