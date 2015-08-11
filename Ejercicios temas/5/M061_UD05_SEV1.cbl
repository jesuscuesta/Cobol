123456 IDENTIFICATION DIVISION.
       PROGRAM-ID. UD05E1. 
       REMARKS. UNIDAD 5. EJERCICIO 1.
      *
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.   
123456*			  
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 OPCION    PIC X.
      *
       PROCEDURE DIVISION.
       INICIO.
           DISPLAY SPACE ERASE.
      *
      * Mostrar opciones de menu en pantalla
      * 
           DISPLAY '1-Ejercicio 1'          LINE  5 POSITION 5.  
           DISPLAY '2-Ejercicio 2'          LINE  6 POSITION 5.
           DISPLAY '3-Ejercicio 3'          LINE  7 POSITION 5.
           DISPLAY '4-Ejercicio 4'          LINE  8 POSITION 5.
           DISPLAY '5-Ejercicio 5'          LINE  9 POSITION 5.
           DISPLAY '6-Ejercicio 6'          LINE 10 POSITION 5.
           DISPLAY '9- Salir del programa'  LINE 12 POSITION 5.
      *
           DISPLAY 'Elige una opcion: ' LINE 15 POSITION 5.
           ACCEPT OPCION LINE 15 POSITION 23 NO BEEP.
           PERFORM PEDIR UNTIL OPCION = '9'
           STOP RUN.
      *
       PEDIR.
           IF OPCION = '1'
              DISPLAY 'Se ha elegido la opcion ' NO ADVANCING
                    LINE 17 POSITION 10
              DISPLAY OPCION
             ELSE
              IF OPCION = '2'
                 DISPLAY 'Se ha elegido la opcion ' NO ADVANCING
                       LINE 17 POSITION 10
                 DISPLAY OPCION
              ELSE 
               IF OPCION = '3'
                  DISPLAY 'Se ha elegido la opcion ' NO ADVANCING
                        LINE 17 POSITION 10
                  DISPLAY OPCION
               ELSE 
                IF OPCION = '4'
                   DISPLAY 'Se ha elegido la opcion ' NO ADVANCING
                         LINE 17 POSITION 10
                   DISPLAY OPCION
                ELSE 
                 IF OPCION = '5'
                    DISPLAY 'Se ha elegido la opcion ' NO ADVANCING
                          LINE 17 POSITION 10
                    DISPLAY OPCION
                 ELSE 
                  IF OPCION = '6'
                     DISPLAY 'Se ha elegido la opcion ' NO ADVANCING
                           LINE 17 POSITION 10
                     DISPLAY OPCION
                  ELSE 
                   DISPLAY 'Opcion erronea             ' NO ADVANCING
                         LINE 17 POSITION 10.
123456*
           MOVE SPACES TO OPCION.
           ACCEPT OPCION LINE 15 POSITION 23 NO BEEP.
