123456 IDENTIFICATION DIVISION. 
       PROGRAM-ID. UD05E3.
       REMARKS. UNIDAD 5. EJERCICIO 3.
      *
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.   
      *			  
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 NOMBRE    PIC  X(15).
       77 APELLIDO1 PIC  X(15).
       77 APELLIDO2 PIC  X(15).
       77 SEXO      PIC  X.
       77 GUION     PIC X(64) VALUE ALL '-'.
       77 LIN       PIC 99.
       77 CONTADOR  PIC 99.
      *
       PROCEDURE DIVISION.
       INICIO.
           PERFORM PREPARAR.
           PERFORM PANTALLA.
           PERFORM PEDIR 10 TIMES.
           STOP RUN.
      *
      * Limpia la pantalla e inicializa variables.
       PREPARAR.
           DISPLAY SPACE ERASE.
           MOVE 8 TO LIN.
           MOVE ZEROS TO CONTADOR.
      *
      * ************************************************
      * Mostrar Cabecera de pantalla
      * ************************************************
       PANTALLA.  
           DISPLAY 'N.'         LINE  7 POSITION 3  HIGH.
           DISPLAY 'NOMBRE'     LINE  7 POSITION 6  HIGH.
           DISPLAY 'APELLIDO 1' LINE  7 POSITION 23 HIGH.
           DISPLAY 'APELLIDO 2' LINE  7 POSITION 40 HIGH.
           DISPLAY 'SEXO'       LINE  7 POSITION 58 HIGH.
           DISPLAY GUION        LINE  8 POSITION 3  HIGH.
      *
      * ************************************************
      * Peticion de datos
      * ************************************************
       PEDIR.
           DISPLAY SPACES LINE 23 COLUMN 1 ERASE EOS.
           DISPLAY 'Introduce el nombre.:'  
                    NO ADVANCING LINE 23 POSITION 5 HIGH.
           ACCEPT NOMBRE NO BEEP.
      * 
           DISPLAY SPACES LINE 23 COLUMN 1 ERASE EOS.
           DISPLAY 'Introduce el primer apellido.:'  
                    NO ADVANCING LINE 23 POSITION 5 HIGH.
           ACCEPT APELLIDO1 NO BEEP.
      * 
           DISPLAY SPACES LINE 23 COLUMN 1 ERASE EOS.
           DISPLAY 'Introduce el segundo apellido.:'  
                    NO ADVANCING LINE 23 POSITION 5 HIGH.
           ACCEPT APELLIDO2 NO BEEP.
      *
           DISPLAY SPACES LINE 23 COLUMN 1 ERASE EOS.
           DISPLAY 'Introduce el sexo.:'
                    NO ADVANCING LINE 23 POSITION 5 HIGH.
           ACCEPT SEXO NO BEEP.
      *
      * Muestra el contenido introducido
           PERFORM MOSTRAR.
      *
      * ************************************************
      * Muestra la informacion introducida
      * ************************************************
       MOSTRAR.
           ADD 1 TO LIN.
           ADD 1 TO CONTADOR.
           DISPLAY CONTADOR    LINE LIN POSITION 3.
           DISPLAY NOMBRE      LINE LIN POSITION 6.
           DISPLAY APELLIDO1   LINE LIN POSITION 23.
           DISPLAY APELLIDO2   LINE LIN POSITION 40.
           IF SEXO = 'M' OR SEXO = 'm' THEN
                   DISPLAY 'Masculino'   LINE LIN POSITION 58
             ELSE  IF SEXO = 'F' OR SEXO = 'f' THEN 
                   DISPLAY 'Femenino'    LINE LIN POSITION 58
                      ELSE
                         DISPLAY 'Desconocido' LINE LIN POSITION 58.

