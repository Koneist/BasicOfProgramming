PROGRAM WriteSymbol(INPUT, OUTPUT);
CONST
  Min = 1;
  Max = 25;
  StrLen = 5;
  SymbForCrypt = 'X';
  SymbForSpace = ' ';
TYPE
  Matrix = SET OF Min..Max;
VAR
  Ch: CHAR;
  Symbol: Matrix;

FUNCTION GetSymbolPreset(VAR TempCh: CHAR): Matrix;
BEGIN
  CASE TempCh OF
    'A': GetSymbolPreset := [1, 6, 7, 11, 13, 16, 17, 18, 19, 21, 25];
    'B': GetSymbolPreset := [1, 2, 3, 4, 6, 10, 11, 12, 13, 14, 16, 20, 21, 22, 23, 24];
    'C': GetSymbolPreset := [2, 3, 4, 5, 6, 11, 16, 22, 23, 24, 25];
    'D': GetSymbolPreset := [1, 2, 3, 4, 6, 10, 11, 15, 16, 20, 21, 22, 23, 24];
    'E': GetSymbolPreset := [1, 2, 3, 4, 5, 6, 11, 12, 13, 14, 15, 16, 21, 22, 23, 24, 25];
    'F': GetSymbolPreset := [1, 2, 3, 4, 5, 6, 11, 12, 13, 16, 21];
    'G': GetSymbolPreset := [2, 3, 4, 6, 11, 13, 14, 15, 16, 20, 22, 23, 24];
    'H': GetSymbolPreset := [1, 5, 6, 10, 11, 12, 13, 14, 15, 16, 20, 21, 25];
    'I': GetSymbolPreset := [2, 3, 4, 8, 13, 18, 22, 23, 24];
    'J': GetSymbolPreset := [1, 2, 3, 4, 5, 8, 13, 16, 18, 22];
    'K': GetSymbolPreset := [1, 4, 6, 8, 11, 12, 16, 18, 21, 24];
    'L': GetSymbolPreset := [1, 6, 11, 16, 21, 22, 23, 24, 25];
    'M': GetSymbolPreset := [1, 5, 6, 7, 9, 10, 11, 13, 15, 16, 20, 21, 25];
    'N': GetSymbolPreset := [1, 5, 6, 7, 10, 11, 13, 15, 16, 19, 20, 21, 25];
    'O': GetSymbolPreset := [2, 3, 4, 6, 10, 11, 15, 16, 20, 22, 23, 24];
    'P': GetSymbolPreset := [1, 2, 3, 6, 9, 11, 12, 13, 16, 21];
    'Q': GetSymbolPreset := [2, 3, 4, 6, 10, 11, 15, 16, 19, 22, 23, 25];
    'R': GetSymbolPreset := [1, 2, 6, 8, 11, 12, 16, 18, 21, 24];
    'S': GetSymbolPreset := [2, 3, 4, 5, 6, 12, 13, 14, 20, 21, 22, 23, 24];
    'T': GetSymbolPreset := [1, 2, 3, 4, 5, 8, 13, 18, 23];
    'U': GetSymbolPreset := [1, 5, 6, 10, 11, 15, 16, 20, 22, 23, 24];
    'V': GetSymbolPreset := [1, 5, 7, 9, 12, 14, 18];
    'W': GetSymbolPreset := [1, 5, 6, 10, 11, 13, 15, 16, 18, 20, 22, 24];
    'X': GetSymbolPreset := [1, 5, 7, 9, 13, 17, 19, 21, 25];
    'Y': GetSymbolPreset := [1, 5, 7, 9, 13, 18, 23];
    'Z': GetSymbolPreset := [1, 2, 3, 4, 5, 9, 13, 17, 21, 22, 23, 24, 25];
  ELSE
    GetSymbolPreset := []
  END
END;

PROCEDURE WriteMatrixSymbol(VAR Ch: CHAR; Symbol: Matrix);
VAR
  Counter: INTEGER;
BEGIN
  IF Symbol <> []
  THEN
    BEGIN
      WRITELN('Your pseudo-graphic symbol is:');
      FOR Counter := Min TO Max
      DO
        BEGIN
          IF Counter IN Symbol
          THEN
            WRITE(SymbForCrypt)
          ELSE
            WRITE(SymbForSpace);
          IF Counter MOD StrLen = 0
          THEN
            WRITELN
        END
    END
  ELSE
    WRITELN(Ch, ' is invalid symbol')  
END;

BEGIN
  IF NOT EOLN
  THEN
    READ(Ch);
  Symbol := GetSymbolPreset(Ch);
  WriteMatrixSymbol(Ch, Symbol)
END.
