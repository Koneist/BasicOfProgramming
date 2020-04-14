PROGRAM NumberProg(INPUT, OUTPUT);
const
  MAXINT = 32767;
VAR
  Number: INTEGER;
PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
{Считывает текущий символ из файла, если он - цифра, возвращает его 
 преобразуя в значение типа INTEGER. Если считанный символ не цифра
 возвращает -1}
VAR
  Ch: CHAR;
BEGIN {ReadDigit}
  IF NOT EOLN(F)
  THEN
    BEGIN
      READ(F, Ch);
      IF Ch = '1' THEN D := 1 ELSE
      IF Ch = '2' THEN D := 2 ELSE
      IF Ch = '3' THEN D := 3 ELSE
      IF Ch = '4' THEN D := 4 ELSE
      IF Ch = '5' THEN D := 5 ELSE
      IF Ch = '6' THEN D := 6 ELSE
      IF Ch = '7' THEN D := 7 ELSE
      IF Ch = '8' THEN D := 8 ELSE
      IF Ch = '9' THEN D := 9 ELSE
      IF Ch = '0' THEN D := 0
         ELSE D := -1
    END
  ELSE
    D := -1
END; {ReadDigit}

PROCEDURE ReadNumber(VAR F: TEXT; VAR N: INTEGER);
{Преобразует строку цифр из файла до первого нецифрового символа,  в соответствующее целое число N}
VAR
  CurrDigit: INTEGER;
BEGIN {ReadNumber}
  N := 0;
  WHILE (CurrDigit <> -1)
  DO
    BEGIN
      ReadDigit(F, CurrDigit);  
      IF (CurrDigit <> -1) 
      THEN
        IF (N < (MaxInt DIV 10)) OR ((N = (MaxInt DIV 10)) AND (CurrDigit <= (MaxInt MOD 10)))
        THEN
          N := N * 10 + CurrDigit
        ELSE
          N := -1
    END  
END; {ReadNumber}

BEGIN {NumberProg}
  WRITELN('Максимальное допустимое число: ', MAXINT);
  ReadNumber(INPUT, Number);
  WRITELN(Number)  
END. {NumberProg}
