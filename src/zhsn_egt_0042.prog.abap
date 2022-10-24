*&---------------------------------------------------------------------*
*& Report  ZHSN_EGT_0042
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zhsn_egt_0042.

DATA: gv_fm_name    TYPE rs38l_fnam,
      gs_controls   TYPE ssfctrlop,
      gs_output_opt TYPE ssfcompop.

DATA: gt_scarr TYPE TABLE OF scarr.

DATA: gv_currcode TYPE s_currcode.

SELECT-OPTIONS: s_code FOR gv_currcode.
PARAMETERS: p_active TYPE char1.

START-OF-SELECTION.

  SELECT * FROM scarr
    INTO TABLE gt_scarr
    WHERE currcode IN s_code.

  gs_controls-no_dialog = abap_true.
  gs_controls-preview = abap_true.
  gs_output_opt-tddest = 'LOCL'.

  CALL FUNCTION 'SSF_FUNCTION_MODULE_NAME'
    EXPORTING
      formname           = 'ZHSN_SF_0002'
    IMPORTING
      fm_name            = gv_fm_name
    EXCEPTIONS
      no_form            = 1
      no_function_module = 2
      OTHERS             = 3.
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.


  CALL FUNCTION gv_fm_name
    EXPORTING
      control_parameters = gs_controls
      output_options     = gs_output_opt
      user_settings      = ' '
      it_scarr           = gt_scarr
      iv_active          = p_active
    EXCEPTIONS
      formatting_error   = 1
      internal_error     = 2
      send_error         = 3
      user_canceled      = 4
      OTHERS             = 5.
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.
