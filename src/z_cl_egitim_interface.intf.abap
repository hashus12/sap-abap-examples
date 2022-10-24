interface Z_CL_EGITIM_INTERFACE
  public .


  class-methods MULT_NUMBERS
    importing
      value(IV_NUM1) type INT4 optional
      value(IV_NUM2) type INT4 optional
    exporting
      value(EV_RESULT) type INT4 .
endinterface.
