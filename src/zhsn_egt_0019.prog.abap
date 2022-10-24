*&---------------------------------------------------------------------*
*& Report  ZHSN_EGT_0019
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zhsn_egt_0019.

DATA: gv_num TYPE i.
*
*PARAMETERS: p_num TYPE int4 MODIF ID gr1. "oluşan ekran selection screen ekranı.
*"hem text hem input alanı olduğundan yakalayabilmek için gruplayıop id veriyoruz onu da modif id keyworduyle yapabiliriz.
*
*SELECT-OPTIONS : s_num FOR gv_num MODIF ID gr1.
*
*INITIALIZATION.
*  LOOP AT SCREEN.
*    IF screen-group1 EQ 'GR1'.
*      screen-display_3d = 1.
*      screen-input = 0.
*      MODIFY SCREEN.
*    ENDIF.
*  ENDLOOP.
*
*AT SELECTION-SCREEN OUTPUT.  "ekrana gelmeden önce ve ekran her refreshlendiğinde düşen blok. sık kullanılır.
*
*START-OF-SELECTION.          "ilk ekranı geçtikten sonra bir işlem yapıp ya da yapmayıp f8 basarsak bu blok çalışır.
*  """"""""""""""""""""""""""""""boş olduğunda tekrar initialization ve selection screen çalışacak. refleshlemiş gibi olacak ana ekrana gelicek.


PARAMETERS: p_rad1 RADIOBUTTON GROUP rgr1 DEFAULT 'X' USER-COMMAND usrl, "user command sayesinde ,bu radiogruptaki tüm radiobutonlar tıklandığında
            """"""""""""""""""""""""""""""""""""function code tetiklenmiş gibi (buton tıklanmış gibi) ekranda at selection screen output içerisine düşebiliriz.
            p_rad2 RADIOBUTTON GROUP rgr1.

PARAMETERS: p_lifnr  TYPE lifnr    MODIF ID gr1 DEFAULT 'Satıcı Numarası',
            p_lifnrn TYPE name1_gp MODIF ID gr1 DEFAULT 'Satıcı Tanımı',
            p_kunnr  TYPE kunnr    MODIF ID gr2 DEFAULT 'Müşteri Numarası',
            p_kunnrn TYPE name1_gp MODIF ID gr2 DEFAULT 'Müşteri Tanımı'.

AT SELECTION-SCREEN OUTPUT.
  LOOP AT SCREEN.
    IF p_rad1 EQ abap_true.
      IF screen-group1 EQ 'GR1'.
        screen-active = 1.
        MODIFY SCREEN.
      ENDIF.
      IF screen-group1 EQ 'GR2'.
        screen-active = 0.
        MODIFY SCREEN.
      ENDIF.
    ENDIF.
    IF p_rad2 EQ abap_true.
      IF screen-group1 EQ 'GR1'.
        screen-active = 0.
        MODIFY SCREEN.
      ENDIF.
      IF screen-group1 EQ 'GR2'.
        screen-active = 1.
        MODIFY SCREEN.
      ENDIF.
    ENDIF.
  ENDLOOP.
