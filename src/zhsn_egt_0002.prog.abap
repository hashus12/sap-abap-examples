*&---------------------------------------------------------------------*
*& Report  ZHSN_EGT_0002
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zhsn_egt_0002.

*DATA gv_degs1 TYPE i.
*DATA gv_degs2 TYPE n LENGTH 10.

DATA: gv_degs1 TYPE i,
      gv_degs2 TYPE n LENGTH 10,
      gv_sonuc TYPE i,
      gv_metin TYPE string.

gv_degs1 = 0.
gv_degs2 = 136.

*WRITE gv_degs1.
*WRITE / gv_degs2.

*gv_metin = 'Toplama ='.
*gv_sonuc = gv_degs1 + gv_degs2.
*WRITE: gv_metin, gv_sonuc.
*
*gv_sonuc = gv_degs1 - gv_degs2.
*WRITE: / 'Farkı = ',  gv_sonuc.
*
*gv_sonuc = gv_degs1 * gv_degs2.
*WRITE: / 'Çarpımı = ',  gv_sonuc.
*
*gv_sonuc = gv_degs1 / gv_degs2.
*WRITE: / 'Bölümü = ',  gv_sonuc.

*IF gv_degs1 > gv_degs2.
*  WRITE: 'Birinci Sayı Büyüktür!'.
*ENDIF.
*
*IF gv_degs1 < gv_degs2.
*  WRITE: 'İkinci Sayı Büyüktür!'.
*ENDIF.
*
*IF gv_degs1 = gv_degs2.
*  WRITE: 'İki Sayı Eşit!'.
*ENDIF.

*IF gv_degs1 > gv_degs2.
*  WRITE: 'Birinci Sayı Büyüktür!'.
*ELSEIF gv_degs1 < gv_degs2.
*  WRITE: 'İkinci Sayı Büyüktür!'.
*ELSE.
*  WRITE: 'İki Sayı Eşit!'.
*ENDIF.

*IF gv_degs1 = 1.
*  WRITE: 'Değişken değerim 1'.
*ELSEIF gv_degs1 = 2.
*  WRITE: 'Değişken değerim 2'.
*ELSEIF gv_degs1 = 3.
*  WRITE: 'Değişken değerim 3'.
*ELSEIF gv_degs1 = 4.
*  WRITE: 'Değişken değerim 4'.
*ELSEIF gv_degs1 = 5.
*  WRITE: 'Değişken değerim 5'.
*ELSE.
*  WRITE:  'Hiçbir Değere Eşit Değil'.
*ENDIF.

*CASE gv_degs1.
*  WHEN 1.
*    WRITE: 'Değişken değerim 1'.
*  WHEN 2.
*    WRITE: 'Değişken değerim 2'.
*  WHEN 3.
*    WRITE: 'Değişken değerim 3'.
*  WHEN 4.
*    WRITE: 'Değişken değerim 4'.
*  WHEN 5.
*    WRITE: 'Değişken değerim 5'.
*  WHEN 6.
*    WRITE: 'Değişken değerim 6'.
*  WHEN OTHERS.
*    WRITE:  'Hiçbir Değere Eşit Değil'.
*ENDCASE.

*DO 10 TIMES.
*  gv_degs1 = gv_degs1 + 1.
*  WRITE: / gv_degs1, 'Do döngüsünü öğreniyoruz'.
*ENDDO.

*WHILE gv_degs1 < 10.
*  gv_degs1 = gv_degs1 + 1.
*  WRITE: / gv_degs1, 'WHILE döngüsünü öğreniyoruz'.
*ENDWHILE.

* <  LT  less then
* >  GT  greater then
* <= LE  less then equal
* >= GE  greater then equal
* =  EQ  equal
