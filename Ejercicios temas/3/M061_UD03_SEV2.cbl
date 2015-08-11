123456 IDENTIFICATION DIVISION. 
       PROGRAM-ID. UD3E2.
       REMARKS. UNIDAD 3 EJERCICIO 2.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
123456*
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * DeclaraciOn de la variables
       77 NOMBREMES     PIC X(10).
       77 DIAMES        PIC 99.
       77 SALARIO       PIC 99999V99.
       77 TEMPSINDEC    PIC 99.
       77 TEMPCONDEC    PIC 99V999.
123456*   
       PROCEDURE DIVISION.
       INICIO.
123456*
      * Se inicializan las variables con valores
           MOVE 'Septiembre' TO NOMBREMES.
           MOVE 21           TO DIAMES.
           MOVE 1235,80      TO SALARIO.
           MOVE 25           TO TEMPSINDEC.
           MOVE 25,824       TO TEMPCONDEC.
      *
      * Se limpia toda la pantalla
           DISPLAY ' ' LINE 1 COLUMN 1 ERASE EOS.
      * Se muestran los valores
           DISPLAY NOMBREMES    LINE 10 COLUMN 10.
           DISPLAY DIAMES       LINE 12 COLUMN 10.
           DISPLAY SALARIO      LINE 14 COLUMN 10.
           DISPLAY TEMPSINDEC   LINE 16 COLUMN 10 .
           DISPLAY TEMPCONDEC   LINE 18 COLUMN 10.
      *
           STOP RUN.
