*&---------------------------------------------------------------------*
*& Report  ZHSN_EGT_0004
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zhsn_egt_0004.

*----PARAMETERS----
*Kullanıcıdan belirlediğimiz tipte veri girmemizi sağlayan yapı. ABAP keyword
PARAMETERS: p_num1   TYPE int4,
            p_persad TYPE zhsn_persad_de.


*----SELECT-OPTIONS---
TABLES: zhsn_pers_t.
DATA: gv_persoyad TYPE zhsn_perssoyad_de.
*Çok fonksiyonel bir yapı. Çoklu data , aralık vb.
*En fazla 8 karakter olmak zorunda.
SELECT-OPTIONS: s_perssd FOR gv_persoyad,
                s_perscn FOR zhsn_pers_t-pers_cins.

*----CHECKBOX----
*Bir alan iki değer alabilir sadece.
PARAMETERS: p_cbox1 AS CHECKBOX.


*----RADİO BUTTON----
*Birden fazla seçenekten sadece birini seçebilmemizi sağlaya yapılardır.
SELECTION-SCREEN BEGIN OF BLOCK b11 WITH FRAME TITLE text-001.
PARAMETERS: p_rad1 RADIOBUTTON GROUP gr1,
            p_rad2 RADIOBUTTON GROUP gr1,
            p_rad3 RADIOBUTTON GROUP gr1.
SELECTION-SCREEN END OF BLOCK b11.

SELECTION-SCREEN BEGIN OF BLOCK b12 WITH FRAME TITLE text-002.
PARAMETERS: p_rad4 RADIOBUTTON GROUP gr2,
            p_rad5 RADIOBUTTON GROUP gr2.
SELECTION-SCREEN END OF BLOCK b12.

*----SELECTİON SCREEN-----

break hasan.
