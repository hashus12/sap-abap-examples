class Z_CL_EGITIM_CLASS_V2 definition
  public
  final
  create public

  global friends Z_CL_EGITIM_CLASS .

public section.
protected section.
private section.

  class-methods DIFF_NUMBERS
    importing
      value(IV_NUM1) type INT4 optional
      value(IV_NUM2) type INT4 optional
    exporting
      value(EV_RESULT) type INT4 .
ENDCLASS.



CLASS Z_CL_EGITIM_CLASS_V2 IMPLEMENTATION.


  METHOD diff_numbers.
    ev_result = iv_num1 - iv_num2.
  ENDMETHOD.
ENDCLASS.
