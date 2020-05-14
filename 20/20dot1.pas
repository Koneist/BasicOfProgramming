PROGRAM WriteSymbol(INPUT, OUTPUT);
CONST
  Min = 0;
  Max = 25;
TYPE
  Matrix = SET OF Min..Max;
VAR
  Ch: CHAR;
  Symbol: Matrix;

PROCEDURE CheckSymbol(VAR TempCh: CHAR; VAR MatrixSymbol: Matrix);
BEGIN
  CASE TempCh OF
    'A': MatrixSymbol := [1, 6, 7, 11, 13, 16, 17, 18, 19, 21, 25];
    'B': MatrixSymbol := [1, 2, 3, 4, 6, 10, 11, 12, 13, 14, 16, 20, 21, 22, 23, 24];
    'C': MatrixSymbol := [2, 3, 4, 5, 6, 11, 16, 22, 23, 24, 25];
    'D': MatrixSymbol := [1, 2, 3, 4, 6, 10, 11, 15, 16, 20, 21, 22, 23, 24];
    'E': MatrixSymbol := [1, 2, 3, 4, 5, 6, 11, 12, 13, 14, 15, 16, 21, 22, 23, 24, 25];
    'F': MatrixSymbol := [1, 2, 3, 4, 5, 6, 11, 12, 13, 16, 21];
    'G': MatrixSymbol := [2, 3, 4, 6, 11, 13, 14, 15, 16, 20, 22, 23, 24];
    'H': MatrixSymbol := [1, 5, 6, 10, 11, 12, 13, 14, 15, 16, 20, 21, 25];
    'I': MatrixSymbol := [2, 3, 4, 8, 13, 18, 22, 23, 24];
    'J': MatrixSymbol := [1, 2, 3, 4, 5, 8, 13, 16, 18, 22];
    'K': MatrixSymbol := [1, 4, 6, 8, 11, 12, 16, 18, 21, 24];
    'L': MatrixSymbol := [1, 6, 11, 16, 21, 22, 23, 24, 25];
    'M': MatrixSymbol := [1, 5, 6, 7, 9, 10, 11, 13, 15, 16, 20, 21, 25];
    'N': MatrixSymbol := [1, 5, 6, 7, 10, 11, 13, 15, 16, 19, 20, 21, 25];
    'O': MatrixSymbol := [2, 3, 4, 6, 10, 11, 15, 16, 20, 22, 23, 24];
    'P': MatrixSymbol := [1, 2, 3, 6, 9, 11, 12, 13, 16, 21];
    'Q': MatrixSymbol := [2, 3, 4, 6, 10, 11, 15, 16, 19, 22, 23, 25];
    'R': MatrixSymbol := [1, 2, 6, 8, 11, 12, 16, 18, 21, 24];
    'S': MatrixSymbol := [2, 3, 4, 5, 6, 12, 13, 14, 20, 21, 22, 23, 24];
    'T': MatrixSymbol := [1, 2, 3, 4, 5, 8, 13, 18, 23];
    'U': MatrixSymbol := [1, 5, 6, 10, 11, 15, 16, 20, 22, 23, 24];
    'V': MatrixSymbol := [1, 5, 7, 9, 12, 14, 18];
    'W': MatrixSymbol := [1, 5, 6, 10, 11, 13, 15, 16, 18, 20, 22, 24];
    'X': MatrixSymbol := [1, 5, 7, 9, 13, 17, 19, 21, 25];
    'Y': MatrixSymbol := [1, 5, 7, 9, 13, 18, 23];
    'Z': MatrixSymbol := [1, 2, 3, 4, 5, 9, 13, 17, 21, 22, 23, 24, 25];
  ELSE
    MatrixSymbol := [];
  END
END;

PROCEDURE WriteMatrixSymbol(VAR Ch: CHAR; Symbol: Matrix);
VAR
  Counter: INTEGER;
BEGIN
  IF (Symbol <> [])
  THEN
    FOR Counter := Min TO Max
    DO
      BEGIN
        IF (Counter IN Symbol)
        THEN
          WRITE('X')
        ELSE
          WRITE(' ');
        IF (Counter MOD 5 = 0)
        THEN
          WRITELN
      END
  ELSE
    WRITELN(Ch, ' is invalid symbol')  
END;

BEGIN
  READ(Ch);
  CheckSymbol(Ch, Symbol);
  WriteMatrixSymbol(Ch, Symbol);
END.
