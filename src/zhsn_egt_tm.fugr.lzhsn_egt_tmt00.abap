*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZHSN_EGT_PERSL..................................*
DATA:  BEGIN OF STATUS_ZHSN_EGT_PERSL                .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZHSN_EGT_PERSL                .
CONTROLS: TCTRL_ZHSN_EGT_PERSL
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZHSN_EGT_PERSL                .
TABLES: ZHSN_EGT_PERSL                 .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
