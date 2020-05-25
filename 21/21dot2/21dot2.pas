PROGRAM Encryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper 
  и печатает новые символы в OUTPUT}
CONST
  Len = 20;
  SymbArea = ['A' .. 'Z', ' '];
TYPE
  StrLen = 0 .. Len;
  Str = ARRAY [StrLen] OF 'A' .. 'Z';
  Chiper = ARRAY [' ' .. 'Z'] OF CHAR;
VAR
  Msg: Str;
  Code: Chiper;
  I: StrLen;
  ChiperTxt: TEXT;
  Error: BOOLEAN;
  SpaceChiper: CHAR;

PROCEDURE Initialize(VAR Code: Chiper; VAR CodeTxt: TEXT; VAR Error: BOOLEAN);
{Присвоить Code шифр замены}
VAR
  Sieve: SET OF ' '.. 'Z';
  UsedChar: SET OF CHAR;
  Ch1, Ch2, Ch3: CHAR; 
BEGIN {Initialize}
  Sieve := SymbArea;
  UsedChar := [];
  RESET(CodeTxt);
  WHILE NOT EOF(CodeTxt)
  DO
    BEGIN
      IF NOT EOLN(CodeTxt)
      THEN
      BEGIN
      WHILE NOT EOLN(CodeTxt)
      DO
        BEGIN
          Ch1 := Ch2;
          Ch2 := Ch3;
          READ(CodeTxt, Ch3)
        END; 
      IF (Ch1 IN Sieve) AND (Ch2 = '=') AND NOT (Ch3 IN UsedChar) 
      THEN
        BEGIN
          Code[Ch1] := Ch3;
          UsedChar := UsedChar + [Ch3]
        END 
      ELSE
        IF (Ch1 IN Sieve) AND (Ch3 IN UsedChar)
        THEN
          BEGIN
            Error := TRUE;
            WRITELN('Error: Multiple letters have the same cipher.') 
          END
        ELSE
          BEGIN
            Error := TRUE;
            WRITELN('Error: Invalid data format.') 
          END;
      END;     
      READLN(CodeTxt)
    END;
END; {Initialize}
 
PROCEDURE Encode(VAR S: Str; VAR CurrStrLen: StrLen; VAR Error: BOOLEAN);
{Выводит символы из Code, соответствующие символам из S}
VAR
  Index: StrLen;
BEGIN {Encode}
  WRITE('Your message in encrypted form is: ');
  FOR Index := 1 TO CurrStrLen
  DO
    IF S[Index] IN SymbArea 
    THEN
      WRITE(Code[S[Index]])
    ELSE
      WRITE(S[Index]);
  WRITELN
END; {Encode}
 
BEGIN {Encryption}
  ASSIGN(ChiperTxt, 'Cipher.txt');
  RESET(ChiperTxt);
  {Инициализировать Code}
  Initialize(Code, ChiperTxt, Error);
  WHILE NOT Error AND NOT EOF
  DO
    BEGIN
      {читать строку в Msg и распечатать ее}
      WHILE NOT EOLN AND (I < Len)
      DO
        BEGIN
          I := I + 1;
          READ(Msg[I]);
          WRITE(Msg[I])
        END;
      READLN;
      WRITELN;
      WRITELN('Line length is ', I);
      Encode(Msg, I, Error);
      I := 0
    END
END. {Encryption}
