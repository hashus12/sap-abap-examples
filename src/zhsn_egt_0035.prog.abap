*&---------------------------------------------------------------------*
*& Report  ZHSN_EGT_0032
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zhsn_egt_0035.

"Genelde kullanım şekli tek bir kolon tıklanma özelliği önemliyse hotspot kullanılır.Hangi kolon tıklandığının öenmi yok sadece satır önemliyse double click özelliği kullanılır.
INCLUDE zhsn_egt_0035_top.
INCLUDE zhsn_egt_0035_cls.
INCLUDE zhsn_egt_0035_pbo.
INCLUDE zhsn_egt_0035_pai.
INCLUDE zhsn_egt_0035_frm.


START-OF-SELECTION.

  PERFORM get_data.
  PERFORM set_fcat.
  PERFORM set_layout.

  CALL SCREEN 0100.
