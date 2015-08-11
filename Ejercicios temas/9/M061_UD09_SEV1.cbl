123456 IDENTIFICATION DIVISION. 
       PROGRAM-ID. UD09E1.
       REMARKS. UNIDAD 9 EJERCICIO 1.
      *
      * Este programa, crea un fichero de producto y almacena varios registros en él.
      * El programa finaliza cuando se introduce un codigo de producto en blanco.
      *
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
      *
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
            Select FPROD ASSIGN TO DISK 'PRODUCTO.DAT'
            ORGANIZATION IS SEQUENTIAL
            ACCESS MODE IS SEQUENTIAL.
123456*
       DATA DIVISION.
       FILE SECTION.
       FD FPROD LABEL RECORD IS STANDARD.
       01 REGPRO.
          02 PROCOD   PIC XX.
          02 PRODES   PIC X(20).
          02 PROFAM   PIC XXX.
          02 PROQTY   PIC 99999.
          02 PROPRE   PIC 9(6)v99.

       WORKING-STORAGE SECTION.
       77 FECHA      PIC 99999999.
       77 GUION      PIC X(60) VALUE ALL '-'.
       01 FF1.
           02 AA1     PIC 9999.
           02 MM1     PIC 99.
           02 DD1     PIC 99.
       01 FF2.
           02 DD2     PIC 99.
           02 GT1     PIC X   VALUE '/'.
           02 MM2     PIC 99.
           02 GT2     PIC X   VALUE '/'.
           02 AA2     PIC 99.
      *
       01 HR1.
           02 HH1     PIC 99.
           02 NN1     PIC 99.
           02 SS1     PIC 99.
           02 CC1     PIC 99.
       01 HR2.
           02 HH2     PIC 99.
           02 GH1     PIC X   VALUE ':'.
           02 NN2     PIC 99.
           02 GH2     PIC X   VALUE ':'.
           02 SS2     PIC 99.
123456*   
       PROCEDURE DIVISION.
       COMIENZO.
           PERFORM INICIO.
           PERFORM PROCESO.
           PERFORM FIN.
      *
           STOP RUN.
      *
      * ************************************************
      * Inicio
      * ************************************************
        INICIO.
           OPEN OUTPUT FPROD.
      *
           ACCEPT FECHA FROM DATE.
           ACCEPT HR1   FROM TIME.
           MOVE FECHA   TO   FF1.
      * 
           MOVE DD1   TO DD2.
           MOVE MM1   TO MM2.
           MOVE AA1   TO AA2.
      *
           MOVE HH1   TO HH2.
           MOVE NN1   TO NN2.
           MOVE SS1   TO SS2.
      *
      * Inicializar variables.
           MOVE HIGH-VALUES TO PROCOD.
      *
      * ************************************************
      * Proceso del programa
      * ************************************************
        PROCESO.
           PERFORM PANTALLA.
           PERFORM PEDIR UNTIL PROCOD = SPACES.
      *
      * ************************************************
      * Instrucciones antes de finalizar el programa
      * ************************************************
        FIN.
           CLOSE FPROD.
      *
      * ************************************************
      * Mostrar Cabecera de pantalla
      * ************************************************
       PANTALLA.  
           DISPLAY SPACES ERASE.
           DISPLAY 'Empresa distribuidora, S.A.' 
                                  LINE  1 POSITION 2 HIGH.
           DISPLAY 'Grupo D&S'    LINE  2 POSITION 2 HIGH.
           DISPLAY 'Fecha:'       NO ADVANCING LINE  1 POSITION 60 HIGH. 
           DISPLAY FF2.
           DISPLAY 'Hora.:'       NO ADVANCING LINE  2 POSITION 60 HIGH. 
           DISPLAY HR2.
           DISPLAY 'INTRODUCCION DE DATOS DE PRODUCTO'     
                                   LINE  3 POSITION 26 REVERSE HIGH.
      *
           DISPLAY 'Codigo......:' LINE  7 POSITION 10 HIGH.
           DISPLAY 'Descripcion.:' LINE  9 POSITION 10 HIGH.
           DISPLAY 'Familia.....:' LINE 11 POSITION 10 HIGH.
           DISPLAY 'Cantidad....:' LINE 13 POSITION 10 HIGH.
           DISPLAY 'Precio......:' LINE 15 POSITION 10 HIGH.
      *
           DISPLAY GUION           LINE 22 POSITION 10 HIGH
           DISPLAY 'Introduzca un codigo en blanco para salir'
                                   LINE 23 POSITION 10 HIGH.
     *
      * ************************************************
      * Pedir datos
      * ************************************************
       PEDIR.
      *
      * Se inicializan las variables para que no se almacenen con el valor anterior.
           MOVE SPACES TO PROCOD.
           MOVE SPACES TO PRODES.
           MOVE SPACES TO PROFAM.
           MOVE ZEROS  TO PROQTY.
           MOVE ZEROS  TO PROPRE.
      *
      * Introducir la información si se ha introducido un codigo de producto
           ACCEPT PROCOD      LINE  7 POSITION 23 NO BEEP.
           IF PROCOD NOT = SPACES THEN
              ACCEPT PRODES   LINE  9 POSITION 23 NO BEEP
              ACCEPT PROFAM   LINE 11 POSITION 23 NO BEEP
              ACCEPT PROQTY   LINE 13 POSITION 23 NO BEEP
              ACCEPT PROPRE   LINE 15 POSITION 23 NO BEEP
      *
      * Escritura del registro y limpieza de pantalla
              WRITE REGPRO.
      *
           DISPLAY SPACES LINE  7 POSITION 23 ERASE EOL.  
           DISPLAY SPACES LINE  9 POSITION 23 ERASE EOL.
           DISPLAY SPACES LINE 11 POSITION 23 ERASE EOL.
           DISPLAY SPACES LINE 13 POSITION 23 ERASE EOL.
           DISPLAY SPACES LINE 15 POSITION 23 ERASE EOL.
