123456 IDENTIFICATION DIVISION. 
       PROGRAM-ID. UD09E2.
       REMARKS. UNIDAD 9 EJERCICIO 2.
      *
      * Este programa muestra por pantalla datos del fichero PRODUCTO.DAT, controlando.
      * si se llega al final de la pantalla.
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
       77 GUION      PIC X(70) VALUE ALL '-'.
       77 MENSAJE    PIC X(70) VALUE ' MENSAJES:'.
       77 CONTINUA   PIC X.
       77 FIN        PIC X.
       77 LIN        PIC 99.
      *
      * Variables de edicion.
       77 ZQTY       PIC ZZ.ZZ9.
       77 ZPRE       PIC ZZZ.ZZ9,99.
      *
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
           OPEN INPUT FPROD.
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
           MOVE 6  TO LIN.
      *
      * ************************************************
      * Proceso del programa
      * ************************************************
        PROCESO.
           PERFORM PANTALLA.
           MOVE SPACE TO FIN.
           READ FPROD AT END MOVE 'S' TO FIN.
           IF FIN = 'S' THEN
              DISPLAY 'El fichero esta vacio' 
                          LINE 23 POSITION 15 REVERSE 
              ACCEPT CONTINUA LINE 23 POSITION 79.
      *
           PERFORM MOSTRAR UNTIL FIN = 'S'.
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
           DISPLAY 'LISTADO DE PRODUCTOS'     
                                   LINE  3 POSITION 30 REVERSE HIGH.
      *
           DISPLAY 'Codigo'       LINE  5 POSITION  3 HIGH.
           DISPLAY 'Descripcion'  LINE  5 POSITION 10 HIGH.
           DISPLAY 'Familia'      LINE  5 POSITION 33 HIGH.
           DISPLAY 'Cantidad'     LINE  5 POSITION 42 HIGH.
           DISPLAY 'Precio'       LINE  5 POSITION 54 HIGH.
      *
           DISPLAY GUION          LINE  6 POSITION 3 HIGH.
           DISPLAY GUION          LINE 22 POSITION 3 HIGH.
           DISPLAY MENSAJE        LINE 23 POSITION 3 REVERSE.
      *
      * ************************************************
      * Muestra la información en pantalla
      * ************************************************
       MOSTRAR.
      *
      * Si se ha alcanzado el límite de líneas en pantalla, mostrar mensaje y borrar pantalla
           ADD 1 TO LIN.
           IF LIN > 20 THEN 
              DISPLAY 'Pulse una tecla para continuar' 
                          LINE 23 POSITION 15 REVERSE 
              ACCEPT CONTINUA LINE 23 POSITION 79
              DISPLAY MENSAJE LINE 23 POSITION  3 REVERSE
              MOVE 7 TO LIN
              PERFORM BORRAR-PANTALLA 15 TIMES
              MOVE 7 TO LIN.
      *
      * Mostrar información
           DISPLAY PROCOD   LINE LIN POSITION  5.
           DISPLAY PRODES   LINE LIN POSITION 10.
           DISPLAY PROFAM   LINE LIN POSITION 33.
           MOVE PROQTY TO ZQTY.
           DISPLAY ZQTY   LINE LIN POSITION 42.
           MOVE PROPRE TO ZPRE.
           DISPLAY ZPRE   LINE LIN POSITION 54.
      *
      * Lee siguiente registro.
           READ FPROD AT END MOVE 'S' TO FIN.
      *
      * ************************************************
      * Borra la información de la pantalla
      * ************************************************
       BORRAR-PANTALLA.
           DISPLAY SPACES LINE LIN POSITION  3 ERASE EOL.
           ADD 1 TO LIN.
