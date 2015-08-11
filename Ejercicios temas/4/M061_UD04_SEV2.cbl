123456 IDENTIFICATION DIVISION.
       PROGRAM-ID. UD4E2. 
       REMARKS. UNIDAD 4 EJERCICIO 2.
      *
      * Este programa pide por pantalla el nombre y apellidos, peso y altura para posteriormente, 
      * y tras calcular el indice de masa corporal, escibir apellido1 apellido2, nombre y el 
      * indice de masa corporal.
      *
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
123456*
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *
       77 NOMBRE      PIC X(10).
       77 APELLIDO1   PIC X(10).
       77 APELLIDO2   PIC X(10).
       77 PESO        PIC 999.
       77 ALTURA      PIC   9V99.
       77 IMC         PIC  99V99.
       77 IMCDISPL    PIC  Z9,99.
      *   
       PROCEDURE DIVISION.
       INICIO.
      *
      * Se limpia la pantalla.
           DISPLAY ' ' LINE 1 COLUMN 1 ERASE EOS.
      *
      * Se solicita la informacion.
           DISPLAY 'Introduce el nombre....: ' LINE 5  COLUMN 5.     
           DISPLAY 'Introduce el apellido 1: ' LINE 7  COLUMN 5.     
           DISPLAY 'Introduce el apellido 2: ' LINE 9  COLUMN 5.     
           DISPLAY 'Introduce tu peso (kg) : ' LINE 11 COLUMN 5.   
           DISPLAY 'Introduce tu altura (m): ' LINE 13 COLUMN 5.   
      *
           ACCEPT NOMBRE    LINE  5 COLUMN 30.
           ACCEPT APELLIDO1 LINE  7 COLUMN 30 NO BEEP.
           ACCEPT APELLIDO2 LINE  9 COLUMN 30 NO BEEP.
           ACCEPT PESO      LINE 11 COLUMN 30 NO BEEP.
           ACCEPT ALTURA    LINE 13 COLUMN 30 NO BEEP.
      *
      * Calculo del IMC
           COMPUTE IMC = PESO / (ALTURA * ALTURA).
           MOVE IMC TO IMCDISPL.
      *
      * Se muestra la informacion.
           DISPLAY ' ' LINE 1 COLUMN 1 ERASE EOS.
           DISPLAY 'Hola '              NO ADVANCING LINE 10 COLUMN 5.
           DISPLAY APELLIDO1            NO ADVANCING.
           DISPLAY APELLIDO2            NO ADVANCING.
           DISPLAY ','                  NO ADVANCING.
           DISPLAY NOMBRE               NO ADVANCING.
           DISPLAY ' , tu IMC es de: '  NO ADVANCING.
           DISPLAY IMCDISPL             NO ADVANCING.

      *
           STOP RUN.
