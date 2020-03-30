PROGRAM NumberProg(INPUT, OUTPUT);
VAR
  MaxInt, Number: INTEGER;
PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
{��������� ������� ������ �� �����, ���� �� - �����, ���������� ��� 
 ���������� � �������� ���� INTEGER. ���� ��������� ������ �� �����
 ���������� -1}
VAR
  Ch: CHAR;
BEGIN {ReadDigit}
  READ(F, Ch);
  IF (Ch = '1') THEN D := 1 ELSE
  IF (Ch = '2') THEN D := 2 ELSE
  IF (Ch = '3') THEN D := 3 ELSE
  IF (Ch = '4') THEN D := 4 ELSE
  IF (Ch = '5') THEN D := 5 ELSE
  IF (Ch = '6') THEN D := 6 ELSE
  IF (Ch = '7') THEN D := 7 ELSE
  IF (Ch = '8') THEN D := 8 ELSE
  IF (Ch = '9') THEN D := 9 ELSE
  IF (Ch = '0') THEN D := 0
     ELSE D := -1
END; {ReadDigit}

PROCEDURE ReadNumber(VAR F: TEXT; VAR N: INTEGER);
{����������� ������ ���� �� ����� �� ������� ����������� �������,  � ��������������� ����� ����� N}
VAR
  CurrDigit: INTEGER;
BEGIN 
  N := 0;
  WHILE (NOT EOLN(F)) AND (CurrDigit <> -1)
  DO
    BEGIN
      ReadDigit(F, CurrDigit);  
      IF (CurrDigit <> -1) 
      THEN
        IF ((N < (MaxInt DIV 10)) OR ((N = (MaxInt DIV 10)) AND (CurrDigit <= (MaxInt MOD 10))))
        THEN
          N := N * 10 + CurrDigit
        ELSE
          N := -1
    END  
END; {ReadNumber}

BEGIN {NumberProg}
  MaxInt := 32767;
  WRITELN('������������ ���������� �����: ', MaxInt);
  ReadNumber(INPUT, Number);
  WRITELN(Number)  
END. {NumberProg}
