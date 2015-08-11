123456 IDENTIFICATION DIVISION. 
       PROGRAM-ID. UD4E1.
       REMARKS. UNIDAD 4 EJERCICIO 1.
      *
      * Este programa pide por pantalla dos numeros y realiza calculos artimeticos: suma, resta,
      * multiplicacion, division y resto
      *
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
123456*
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *
       77 NUM1        PIC 99.
       77 NUM2        PIC 99.
       77 RESULTADO   PIC 999.
       77 RESTO       PIC 99.
      *   
       PROCEDURE DIVISION.
       INICIO.
      *
      * Se limpia la pantalla.
           DISPLAY ' ' LINE 1 COLUMN 1 ERASE EOS.
      *
      * Se solicita la informacion.
           DISPLAY 'Introduce el primer numero...: ' LINE 5  COLUMN 5.     
           DISPLAY 'Introduce el segundo numero. : ' LINE 7  COLUMN 5.   
           MOVE ZEROS TO NUM1.
           MOVE ZEROS TO NUM2.
           ACCEPT NUM1 LINE 5 POSITION 35 NO BEEP.  
           ACCEPT NUM2 LINE 7 POSITION 35 NO BEEP.  
      *
      * Calculos ***************************
      *
           DISPLAY 'La suma de los numeros introducidos es : '     
                    NO ADVANCING LINE  9 COLUMN 5.   
           ADD NUM1 TO NUM2 GIVING RESULTADO.
           DISPLAY RESULTADO.
      *  
           DISPLAY 'La resta de los numeros introducidos es : '    
                    NO ADVANCING LINE 11 COLUMN 5.     
           SUBTRACT NUM1 FROM NUM2 GIVING RESULTADO.
           DISPLAY RESULTADO.
      *
           DISPLAY 'El producto de los numeros introducidos es : ' 
                    NO ADVANCING LINE 13 COLUMN 5.     
           MULTIPLY NUM1 BY NUM2 GIVING RESULTADO.
           DISPLAY RESULTADO.
      *
           DISPLAY 'La division de los numeros introducidos es : ' 
                    NO ADVANCING LINE 15 COLUMN 5.     
           DIVIDE NUM2 INTO NUM1 GIVING RESULTADO REMAINDER RESTO.
           DISPLAY RESULTADO.
      *
           DISPLAY 'y el resto de los numeros es : '    
                    NO ADVANCING LINE 17 COLUMN 5.     
           DISPLAY RESTO.
      *
           STOP RUN.
