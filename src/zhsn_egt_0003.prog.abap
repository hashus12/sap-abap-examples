*&---------------------------------------------------------------------*
*& Report  ZHSN_EGT_0003
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zhsn_egt_0003.

DATA: gv_persid    TYPE zhsn_persid_de,
      gv_persad    TYPE zhsn_persad_de,
      gv_perssoyad TYPE zhsn_perssoyad_de,
      gv_perscins  TYPE zhsn_perscins_de,
      gs_pers_t    TYPE zhsn_pers_t,
      gt_pers_t    TYPE TABLE OF zhsn_pers_t.


*SELECT
*UPDATE
*INSERT
*DELETE
*MODIFY


*SELECT * FROM zhsn_pers_t
*INTO CORRESPONDING FIELDS OF TABLE gt_pers_t
*  WHERE pers_id EQ 1.
*
*SELECT SINGLE * FROM zhsn_pers_t
*  INTO gs_pers_t.
*
**CORRESPONDING fields of  "aynı kolonlaarı çeker.
*
*SELECT SINGLE pers_id FROM zhsn_pers_t
*  INTO gv_persid.


*UPDATE zhsn_pers_t SET pers_ad = 'HAKAN'
*  WHERE pers_id EQ 1.
*
*WRITE: 'Update komutu çalıştırıldı.'.

*gs_pers_t-pers_id = 3.
*gs_pers_t-pers_ad = 'FURKAN'.
*gs_pers_t-pers_soyad = 'SOYLEMEZ'.
*gs_pers_t-pers_cins = 'e'.
*
*
*INSERT zhsn_pers_t FROM gs_pers_t.
*WRITE: 'Update komutu çalıştırıldı.'.

*DELETE FROM zhsn_pers_t WHERE pers_id EQ 2.

*
*gs_pers_t-pers_id = 4.
*gs_pers_t-pers_ad = 'Gülçin'.
*gs_pers_t-pers_soyad = 'KOCAASLAN'.
*gs_pers_t-pers_cins = 'K'.
*
*MODIFY zhsn_pers_t FROM gs_pers_t.
