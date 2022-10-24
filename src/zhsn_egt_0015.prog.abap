*&---------------------------------------------------------------------*
*& Report  ZHSN_EGT_0015
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zhsn_egt_0015.

TYPES ty_t_vrm_values TYPE TABLE OF vrm_value. "occurs 0 eski yazım.
DATA: gv_ad    TYPE char20,
      gv_soyad TYPE char30.

DATA: gv_rad1 TYPE char1,
      gv_rad2 TYPE xfeld.

DATA: gv_cbox TYPE xfeld.

DATA: gv_yas TYPE i.

DATA: ok_code TYPE sy-ucomm.

DATA: gv_id     TYPE vrm_id,
      gt_values TYPE vrm_values,
      gs_value  TYPE vrm_value.  "typeleri neden farklı?

DATA: gv_ind TYPE i.

DATA: gv_date TYPE datum.

DATA: gs_log TYPE zhsn_egt_0001.

CONTROLS tb_id TYPE TABSTRIP.

START-OF-SELECTION.

  gv_ind = 18.
  DO 60 TIMES.
    gs_value-key =  gv_ind.
    gs_value-text =  gv_ind.
    APPEND gs_value TO gt_values.
    gv_ind = gv_ind + 1.
  ENDDO.

  CALL SCREEN 0100.

*&---------------------------------------------------------------------*
*&      Module  STATUS_0100  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
  SET PF-STATUS '0100'.
*  SET TITLEBAR 'xxx'.

  gv_id = 'GV_YAS'.   "neden string yazdık?

*  gv_id = 'GV_YAS'.
*  gs_value-key = '1'.
*  gs_value-text = '18 yaş'.
*  APPEND gs_value TO gt_values.
*
*  gs_value-key = '2'.
*  gs_value-text = '19 yaş'.
*  APPEND gs_value TO gt_values.



  CALL FUNCTION 'VRM_SET_VALUES'
    EXPORTING
      id     = gv_id
      values = gt_values.

ENDMODULE.

*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.
*  CASE sy-ucomm.
  CASE ok_code.
    WHEN '&BACK'.
      LEAVE TO SCREEN 0.
    WHEN '&CLEAR'.
      PERFORM clear_data.
    WHEN '&SAVE'.
      PERFORM save_data.
    WHEN '&TAB1'.
      tb_id-activetab = '&TAB1'.
    WHEN '&TAB2'.
      tb_id-activetab = '&TAB2'.
*      DATA: lv_yas_c TYPE char10.
*      lv_yas_c = gv_yas.
*      MESSAGE lv_yas_c TYPE 'I'.
*      LEAVE TO SCREEN 0.
  endcase.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Form  CLEAR_DATA
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM clear_data .
  CLEAR: gv_ad,
         gv_soyad,
         gv_yas,
         gv_cbox,
         gv_date,
         gv_rad2.
  gv_rad1 = abap_true.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  SAVE_DATA
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM save_data .
  gs_log-ad = gv_ad.
  gs_log-soyad = gv_soyad.
  gs_log-cbox = gv_cbox.
  gs_log-yas = gv_yas.
  gs_log-zdate = gv_date.
  IF gv_rad1 EQ abap_true.
    gs_log-cinsiyet = 'K'.
  ELSE.
    gs_log-cinsiyet = 'E'.
  ENDIF.
  INSERT zhsn_egt_0001 FROM gs_log.
  COMMIT WORK AND WAIT. "Artık se16n den anlık olarak görüntüleyebiliriz.
  MESSAGE 'Veriler tabloya kaydedilmiştir.' TYPE 'I' DISPLAY LIKE 'S'.
ENDFORM.
