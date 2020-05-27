PROGRAM Decryption(INPUT, OUTPUT);
CONST
  Len = 20;
  SymbArea = ['A' .. 'Z', ' '];
  CodeArea = [' ' .. 'Z'];
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
VAR
  UsedChar: SET OF CHAR;
  Ch1, Ch2, Ch3: CHAR; 
BEGIN {Initialize}
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
          IF (Ch1 IN SymbArea) AND (Ch2 = '=') AND NOT (Ch3 IN UsedChar) AND (Ch3 IN CodeArea)
          THEN
            BEGIN
              Code[Ch3] := Ch1;
              UsedChar := UsedChar + [Ch3]
            END 
          ELSE
            IF (Ch1 IN SymbArea) AND (Ch3 IN UsedChar)
            THEN
              BEGIN
                Error := TRUE;
                WRITELN('Error: Multiple letters have the same cipher.') 
              END
            ELSE
              IF Ch2 <> '='
              THEN
                BEGIN
                  Error := TRUE;
                  WRITELN('Error: Invalid data format.') 
                END;
      END;     
      READLN(CodeTxt)
    END
END; {Initialize}
 
PROCEDURE Decode(VAR S: Str; VAR CurrStrLen: StrLen; VAR Error: BOOLEAN);
VAR
  Index: StrLen;
BEGIN {Decode}
  WRITE('Your message in decrypted form is: ');
  FOR Index := 1 TO CurrStrLen
  DO
    IF (S[Index] IN CodeArea) AND (Code[S[Index]] IN SymbArea)
    THEN
      WRITE(Code[S[Index]])
    ELSE
      WRITE(S[Index]);
  WRITELN
END; {Decode}
 
BEGIN {Decryption}
  ASSIGN(ChiperTxt, 'Cipher.txt');
  RESET(ChiperTxt);
  Initialize(Code, ChiperTxt, Error);
  WHILE NOT Error AND NOT EOF
  DO
    BEGIN
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
      Decode(Msg, I, Error);
      I := 0
    END
END. {Decryption}
