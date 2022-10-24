*&---------------------------------------------------------------------*
*& Report  ZHSN_EGT_0034
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zhsn_egt_0034.

"hotspot genelde işlem koduna gitmek için kullanılır. örnek bir malzeme satırının detaylarını görmek için tıklandığında o işlem koduna gidilir.
INCLUDE zhsn_egt_0034_top.
INCLUDE zhsn_egt_0034_cls.
INCLUDE zhsn_egt_0034_pbo.
INCLUDE zhsn_egt_0034_pai.
INCLUDE zhsn_egt_0034_frm.


START-OF-SELECTION.

  PERFORM get_data.
  PERFORM set_fcat.
  PERFORM set_layout.

  CALL SCREEN 0100.
