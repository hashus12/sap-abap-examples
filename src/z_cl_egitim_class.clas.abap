class Z_CL_EGITIM_CLASS definition
  public
  final
  create public .

public section.

  interfaces Z_CL_EGITIM_INTERFACE .

  aliases MULT_NUMS
    for Z_CL_EGITIM_INTERFACE~MULT_NUMBERS .

  types NUMBER_TYP type INT4 .

  constants CV_NUMBER type NUMBER_TYP value 100 ##NO_TEXT.

  class-events DIVIDE_NUMBERS
    exporting
      value(IV_NUM1) type INT4 optional
      value(IV_NUM2) type INT4 optional
      value(IV_RESULT) type INT4 optional .

  methods SUM_NUMBERS
    importing
      value(IV_NUM1) type INT4 optional
      value(IV_NUM2) type INT4 optional
    exporting
      value(EV_RESULT) type NUMBER_TYP .
  class-methods SUM_NUMBERS_V2 .
  class-methods DIFF_NUMBERS
    importing
      value(IV_NUM1) type INT4 optional
      value(IV_NUM2) type NUMBER_TYP optional
    exporting
      value(EV_RESULT) type NUMBER_TYP .
  class-methods DIVIDE_NUMS
    for event DIVIDE_NUMBERS of Z_CL_EGITIM_CLASS
    importing
      !IV_NUM1
      !IV_NUM2
      !IV_RESULT .
protected section.
private section.

  methods SUM_NUMBERS_PRIVATE .
ENDCLASS.



CLASS Z_CL_EGITIM_CLASS IMPLEMENTATION.


  METHOD diff_numbers.
    z_cl_egitim_class_v2=>diff_numbers(
    EXPORTING
      iv_num1   = iv_num1    " Doğal sayı
      iv_num2   = iv_num2    " Doğal sayı
    IMPORTING
      ev_result =  ev_result   " Doğal sayı
  ).
  ENDMETHOD.


  method DIVIDE_NUMS.

  endmethod.


  METHOD sum_numbers.
    ev_result = iv_num1 + iv_num2 + cv_number.
  ENDMETHOD.


  method SUM_NUMBERS_PRIVATE.
  endmethod.


  method SUM_NUMBERS_V2.
  endmethod.


  method Z_CL_EGITIM_INTERFACE~MULT_NUMBERS.
  endmethod.
ENDCLASS.
