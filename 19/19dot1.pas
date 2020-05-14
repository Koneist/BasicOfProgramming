PROGRAM Prime(INPUT, OUTPUT);
CONST
  Min = 2;
  Max = 100;
VAR
  CurrNum, TempNum : INTEGER;
  Sieve: SET OF Min..Max;
BEGIN
  Sieve := [Min..Max];
  CurrNum := Min;
  WHILE CurrNum <= Max
  DO
    BEGIN
      IF CurrNum IN Sieve
      THEN
        BEGIN
          TempNum := CurrNum;
          WHILE TempNum <= Max
          DO
            BEGIN
              IF (TempNum MOD CurrNum = 0) AND (TempNum IN Sieve)
              THEN
                BEGIN
                  Sieve := Sieve - [TempNum];
                  IF TempNum DIV CurrNum = 1
                  THEN
                    WRITE(CurrNum, ', ')
                END;
              INC(TempNum)
            END  
        END;
      INC(CurrNum)
    END;
  WRITELN 
END.
