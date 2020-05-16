PROGRAM Prime(INPUT, OUTPUT);
CONST
  Min = 2;
  Max = 100;
VAR
  CurrNum, TempNum : INTEGER;
  Sieve: SET OF Min..Max;
BEGIN {Prime}
  Sieve := [Min..Max];
  CurrNum := Min;
  WHILE CurrNum * CurrNum <= Max
  DO
    BEGIN
      IF CurrNum IN Sieve
      THEN
        BEGIN
          TempNum := CurrNum;
          WHILE TempNum <= Max
          DO
            BEGIN
              IF (TempNum MOD CurrNum = 0)
              THEN
                BEGIN
                  Sieve := Sieve - [TempNum];
                  IF TempNum DIV CurrNum = 1
                  THEN
                    WRITE(CurrNum, ' ')
                END;
              TempNum := TempNum + CurrNum
            END  
        END;
      CurrNum := CurrNum + 1
    END;
  TempNum := Min;
  WHILE TempNum <= Max
  DO
    BEGIN
      IF TempNum IN Sieve
      THEN
        WRITE(TempNum, ' ');
      TempNum := TempNum + 1
    END;
  WRITELN;
END. {Prime}
