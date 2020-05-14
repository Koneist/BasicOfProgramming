PROGRAM Decryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper 
  и печатает новые символы в OUTPUT}
CONST
  Len = 20;
TYPE
  StrLen = 0 .. Len;
  SymbArea = 'A' .. 'Z';
  Str = ARRAY [StrLen] OF SymbArea;
  Chiper = ARRAY [SymbArea] OF CHAR;
VAR
  Msg: Str;
  Code: Chiper;
  I: StrLen;
  ChiperTxt: TEXT;
  Error: BOOLEAN;
  UsedChar: SET OF CHAR;
  SpaceChiper: CHAR;

PROCEDURE Initialize(VAR Code: Chiper; VAR CodeTxt: TEXT; VAR SpaceSymb: CHAR);
{Присвоить Code шифр замены}
VAR
  Sieve: SET OF SymbArea;
  Ch1, Ch2, Ch3: CHAR; 
BEGIN {Initialize}
  Sieve := ['A' .. 'Z'];
  UsedChar := [];
  SpaceSymb := ' ';
  RESET(CodeTxt);
  WHILE NOT EOF(CodeTxt)
  DO
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
          IF Ch1 = ' '
          THEN
            SpaceSymb := Ch3
          ELSE
            BEGIN
              Error := TRUE;
              WRITELN('Error: Invalid data format.') 
            END; 
      READLN(CodeTxt);
    END;
END; {Initialize}
 
PROCEDURE Decode(VAR S: Str; VAR CurrStrLen: StrLen);
{Выводит символы из S, соответствующие символам-индексам из Code}
VAR
  Index: StrLen;
  IndexSymb: SymbArea; 
BEGIN {Decode}
  FOR Index := 1 TO CurrStrLen
  DO
    IF S[Index] IN UsedChar
    THEN
      FOR IndexSymb := 'A' TO 'Z'
      DO
      BEGIN
        IF Code[IndexSymb] = S[Index]
        THEN
          WRITE(IndexSymb)
      END
    ELSE
      IF S[Index] = SpaceChiper
      THEN
        WRITE(' ')
      ELSE
        WRITE(S[Index]);
  WRITELN
END; {Decode}
 
BEGIN {Decryption}
  ASSIGN(ChiperTxt, 'Cipher.txt');
  RESET(ChiperTxt);
  {Инициализировать Code}
  Initialize(Code, ChiperTxt, SpaceChiper);         
  WHILE NOT Error AND NOT EOF(INPUT)
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
      Decode(Msg, I);
      I := 0
    END
END. {Decryption}
