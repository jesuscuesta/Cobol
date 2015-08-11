123456 IDENTIFICATION DIVISION. 
       PROGRAM-ID. UD3E3.
       REMARKS. UNIDAD 3 EJERCICIO 3.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
123456*
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *
      * Declaracion del registro PRODUCTO
       01 REGPRD.
          02 PRDIDENTI     PIC XXX.
          02 PRDNOMBRE     PIC X(20).
          02 PRDNUNIDA     PIC 999.
          02 PRDIMPORT     PIC 999V99.
          02 PRDCADUCI.
             05 CADAA    PIC 9999.          
             05 CADMM    PIC 99.
             05 CADDD    PIC 99.
      *   
       PROCEDURE DIVISION.
       INICIO.
      *
      * Aqui se escribirían las sentencias necesarias de proceso

      *
           STOP RUN.
