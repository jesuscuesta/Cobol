123456 IDENTIFICATION DIVISION.
       PROGRAM-ID. UD10E2.
       REMARKS. UNIDAD 10 EJERCICIO 2.
      *
      * Este programa muestra por pantalla datos del fichero CLIENTE.DAT, a partir 
      * de un código introducido por pantalla, controlando si se llega al final de la pantalla.
      *
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
      *
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
            SELECT FCLI ASSIGN TO DISK 'CLIENTEs.DAT' 
            RECORD KEY IS CLICOD
            ORGANIZATION IS INDEXED
            ACCESS MODE IS DYNAMIC.
123456*
       DATA DIVISION.
       FILE SECTION.
       FD FCLI LABEL RECORD IS STANDARD.
       01 REGCLI.
          02 CLICOD   PIC XX.
          02 CLINOM   PIC X(20).
          02 CLIDIR   PIC X(20).
          02 CLIPOB   PIC X(20).
          02 CLISEX   PIC X.

       WORKING-STORAGE SECTION.
       77 FECHA      PIC 99999999.
       77 GUION      PIC X(76) VALUE ALL '-'.
       77 MENSAJE    PIC X(76) VALUE ' MENSAJES:'.
       77 CONTINUA   PIC X.
       77 FIN        PIC X.
       77 LIN        PIC 99.
      *
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
           OPEN INPUT FCLI.
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
           MOVE 9  TO LIN.
      *
      * ************************************************
      * Proceso del programa
      * ************************************************
        PROCESO.
           PERFORM PANTALLA.
           PERFORM PEDIR.
           MOVE SPACE TO FIN.
           START FCLI KEY NOT LESS CLICOD INVALID KEY MOVE 'S' TO FIN.
           IF FIN = 'S' THEN
              DISPLAY 'El fichero esta vacio' 
                          LINE 23 POSITION 15 REVERSE 
              ACCEPT CONTINUA LINE 23 POSITION 79
           ELSE
              READ  FCLI NEXT RECORD AT END MOVE 'S' TO FIN.
      *
           PERFORM MOSTRAR UNTIL FIN = 'S'.
      *
      * ************************************************
      * Instrucciones antes de finalizar el programa
      * ************************************************
        FIN.
           CLOSE FCLI.
      *
      * ************************************************
      * Mostrar Cabecera de pantalla
      * ************************************************
       PANTALLA.  
           DISPLAY SPACES ERASE.
           DISPLAY 'Empresa distribuidora, S.A.' 
                                  LINE  1 POSITION 2 HIGH.
           DISPLAY 'Grupo D&S'    LINE  2 POSITION 2 HIGH.
           DISPLAY 'Fecha:'       NO ADVANCING LINE  1 POSITION 63 HIGH. 
           DISPLAY FF2.
           DISPLAY 'Hora.:'       NO ADVANCING LINE  2 POSITION 63 HIGH. 
           DISPLAY HR2.
           DISPLAY ' LISTADO DE CLIENTES '     
                                  LINE  3 POSITION 30 REVERSE HIGH.
      *
           DISPLAY 'Codigo...:'   LINE  5 POSITION  3 HIGH.
      *
           DISPLAY 'Codigo'       LINE  8 POSITION  3 HIGH.
           DISPLAY 'Nombre'       LINE  8 POSITION 10 HIGH.
           DISPLAY 'Direccion'    LINE  8 POSITION 32 HIGH.
           DISPLAY 'Poblacion'    LINE  8 POSITION 54 HIGH.
           DISPLAY 'Sexo'         LINE  8 POSITION 75 HIGH.
      *
           DISPLAY GUION          LINE  9 POSITION 3 HIGH.
           DISPLAY GUION          LINE 22 POSITION 3 HIGH.
           DISPLAY MENSAJE        LINE 23 POSITION 3 REVERSE.
      *
      *
      * *************************************************************************
      * Pide el código a partir del cual se muestra la informacion en pantalla
      * *************************************************************************
       PEDIR.
           ACCEPT  CLICOD LINE 5  POSITION 14 NO BEEP.
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
              MOVE 10 TO LIN
              PERFORM BORRAR-PANTALLA 12 TIMES
              MOVE 10 TO LIN.
      *
      * Mostrar información
           DISPLAY CLICOD   LINE LIN POSITION  5.
           DISPLAY CLINOM   LINE LIN POSITION 10.
           DISPLAY CLIDIR   LINE LIN POSITION 32.
           DISPLAY CLIPOB   LINE LIN POSITION 54.
           DISPLAY CLISEX   LINE LIN POSITION 77.
      *
      * Lee siguiente registro.
           READ  FCLI NEXT RECORD AT END MOVE 'S' TO FIN.
      *
      * ************************************************
      * Borra la información de la pantalla
      * ************************************************
       BORRAR-PANTALLA.
           DISPLAY SPACES LINE LIN POSITION  3 ERASE EOL.
           ADD 1 TO LIN.
