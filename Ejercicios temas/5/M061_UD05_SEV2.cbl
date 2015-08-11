123456 IDENTIFICATION DIVISION.
       PROGRAM-ID. UD05E2.
       REMARKS. UNIDAD 5. EJERCICIO 2.
      *
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.   
123456*			  
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 FF.
          02 DD    PIC 99.
          02 MM    PIC 99.
          02 AA    PIC 9999.
      *
       77 FECHA    PIC 9(8).
      *
       PROCEDURE DIVISION.
       INICIO.
           DISPLAY SPACE ERASE.
      *
      * Mostrar mensage de petición de fecha y aceptarla
      * 
           DISPLAY 
             'Introduce una fecha en formato DDMMAAAA:              '  
                    LINE  9 POSITION 5.
           MOVE ZEROS TO FECHA.
           ACCEPT FECHA LINE 9 POSITION 45 NO BEEP.
           PERFORM VALIDAR UNTIL FECHA = ZEROS.
      * 
           STOP RUN.
      *
       VALIDAR.
           MOVE FECHA TO FF.
      *
      * Validación
      * 
           IF AA < 1050 OR AA > 2050 THEN
            DISPLAY 'Fecha erronea. ' 
                    NO ADVANCING LINE 11 POSITION 5 BLINK
            DISPLAY FECHA NO ADVANCING
            DISPLAY '. El año no esta dentro de limites'
           ELSE
           IF MM < 1 OR MM > 12 THEN
            DISPLAY 'Fecha erronea. ' 
                    NO ADVANCING LINE 11 POSITION 5 BLINK
            DISPLAY FECHA NO ADVANCING
            DISPLAY '. El mes no esta dentro de limites'

           ELSE
           IF DD < 1 THEN
            DISPLAY 'Fecha erronea. '
                    NO ADVANCING LINE 11 POSITION 5 BLINK
            DISPLAY FECHA NO ADVANCING
            DISPLAY '. El dia no es correcto          '
           ELSE
           IF DD > 31 AND (MM = 1 OR MM =  3 OR MM =  5 OR MM = 7 
                        OR MM = 8 OR MM = 10 OR MM = 12) THEN
            DISPLAY 'Fecha erronea. '
                    NO ADVANCING LINE 11 POSITION 5 BLINK
            DISPLAY FECHA NO ADVANCING
            DISPLAY '. No es correcto el dia del mes  '
           ELSE
           IF DD > 30 AND (MM = 4 OR MM = 6 OR MM = 9
                                  OR MM = 11) THEN
            DISPLAY 'Fecha erronea. '
                    NO ADVANCING LINE 11 POSITION 5 BLINK
            DISPLAY FECHA NO ADVANCING
            DISPLAY '. No es correcto el dia del mes  '
           ELSE
           IF DD > 28 AND MM = 2 THEN
            DISPLAY 'Fecha erronea. '
                    NO ADVANCING LINE 11 POSITION 5 BLINK
            DISPLAY FECHA NO ADVANCING
            DISPLAY '. No es correcto el dia del mes  '
           ELSE
            DISPLAY 'Fecha correcta: ' 
                    NO ADVANCING LINE 11 POSITION 5 BLINK
            DISPLAY FECHA NO ADVANCING
           DISPLAY '                                         '.
      *
           DISPLAY 
             'Introduce una fecha en formato DDMMAAAA:              '  
                    LINE  9 POSITION 5.
           MOVE ZEROS TO FECHA.
           ACCEPT FECHA LINE 9 POSITION 45 NO BEEP.
