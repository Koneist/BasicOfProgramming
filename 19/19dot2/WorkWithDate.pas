UNIT WorkWithDate;
INTERFACE
TYPE
  Month = (NoMonth, Jan, Feb, Mar, Apr, May, Jun,
                    Jul, Aug, Sep, Oct, Nov, Dec);
  DayNum = 1..31;
  Date = RECORD
           Mo : Month;
           Day: DayNum
         END;
  FileOfDate = FILE OF Date;
  PROCEDURE ReadDate(VAR FIn: TEXT; VAR Result: Date);{��������� ���� �� �����}
  PROCEDURE WriteDate(VAR FOut: TEXT; VAR Result: Date);{������� ���� � ����}
  PROCEDURE WriteMonth(VAR FOut: TEXT; VAR Mo: Month);{������� ����� � ����}
  PROCEDURE ReadMonth(VAR FIn: TEXT; VAR Mo: Month);{��������� ����� �� �����}  
  PROCEDURE CopyOut(VAR DateFile: FileOfDate);{�������� ���� � OUTPUT}
  FUNCTION Less(VAR D1, D2: Date): BOOLEAN;{���������� ������� ����}
  PROCEDURE CopyDate(VAR DFile1, DFile2: FileOfDate);{��������� �� ������� ����� �� ������}
IMPLEMENTATION
  PROCEDURE WriteDate(VAR FOut: TEXT; VAR Result: Date);
  {Result.Mo = MMM, Result.Day = DD => 'MMM DD' }
  BEGIN {WriteDate}
    WriteMonth(FOut, Result.Mo);
    WRITE(FOut, Result.Day : 3)
  END; {WriteDate}
 
  PROCEDURE ReadDate (VAR FIn: TEXT; VAR Result: Date);
  {'MMM/ +/DD' => Result.Mo = MMM, Result.Day = DD }
  BEGIN {ReadDate}
    ReadMonth(FIn, Result.Mo);
    READ(FIn, Result.Day)
  END; {ReadDate}
 
  PROCEDURE ReadMonth(VAR FIn: TEXT; VAR Mo: Month);
  {'MMM/ +/DD' => Result.Mo = MMM}
  VAR
    Ch1, Ch2, Ch3: CHAR;
  BEGIN {ReadMonth}
    IF NOT EOLN(FIn)
    THEN
      READ(FIn, Ch1);
    IF NOT EOLN(FIn)
    THEN
      READ(FIn, Ch2);
    IF NOT EOLN(FIn)
    THEN
      BEGIN
        READ(FIn, Ch3);
        IF (Ch1 = 'J') AND (Ch2 = 'A') AND (Ch3 = 'N') THEN Mo := Jan ELSE
        IF (Ch1 = 'F') AND (Ch2 = 'E') AND (Ch3 = 'B') THEN Mo := Feb ELSE
        IF (Ch1 = 'M') AND (Ch2 = 'A') AND (Ch3 = 'R') THEN Mo := Mar ELSE
        IF (Ch1 = 'A') AND (Ch2 = 'P') AND (Ch3 = 'R') THEN Mo := Apr ELSE
        IF (Ch1 = 'M') AND (Ch2 = 'A') AND (Ch3 = 'Y') THEN Mo := May ELSE
        IF (Ch1 = 'J') AND (Ch2 = 'U') AND (Ch3 = 'N') THEN Mo := Jun ELSE
        IF (Ch1 = 'J') AND (Ch2 = 'U') AND (Ch3 = 'L') THEN Mo := Jul ELSE
        IF (Ch1 = 'A') AND (Ch2 = 'U') AND (Ch3 = 'G') THEN Mo := Aug ELSE
        IF (Ch1 = 'S') AND (Ch2 = 'E') AND (Ch3 = 'P') THEN Mo := Sep ELSE
        IF (Ch1 = 'O') AND (Ch2 = 'C') AND (Ch3 = 'T') THEN Mo := Oct ELSE
        IF (Ch1 = 'N') AND (Ch2 = 'O') AND (Ch3 = 'V') THEN Mo := Nov ELSE
        IF (Ch1 = 'D') AND (Ch2 = 'E') AND (Ch3 = 'C') THEN Mo := Dec
          ELSE Mo := NoMonth
      END
    ELSE
      Mo := NoMonth
  END; {ReadMonth}
 
  PROCEDURE WriteMonth(VAR FOut: TEXT; VAR Mo: Month);
  {Result.Mo = MMM => 'MMM'}
  BEGIN {WriteMonth}
    IF Mo = Jan THEN WRITE(FOut, 'JAN') ELSE
    IF Mo = Feb THEN WRITE(FOut, 'FEB') ELSE
    IF Mo = Mar THEN WRITE(FOut, 'MAR') ELSE
    IF Mo = Apr THEN WRITE(FOut, 'APR') ELSE
    IF Mo = May THEN WRITE(FOut, 'MAY') ELSE
    IF Mo = Jun THEN WRITE(FOut, 'JUN') ELSE
    IF Mo = Jul THEN WRITE(FOut, 'JUL') ELSE
    IF Mo = Aug THEN WRITE(FOut, 'AUG') ELSE
    IF Mo = Sep THEN WRITE(FOut, 'SEP') ELSE
    IF Mo = Oct THEN WRITE(FOut, 'OCT') ELSE
    IF Mo = Nov THEN WRITE(FOut, 'NOV') ELSE
    IF Mo = Dec THEN WRITE(FOut, 'DEC')
      ELSE WRITE(FOut, 'NoMonth')
  END; {WriteMonth}
 
 
  FUNCTION Less(VAR D1, D2: Date): BOOLEAN;
  {Less:= D1 < D2}
  BEGIN {Less}
  IF D1.Mo < D2.Mo
  THEN
    Less := TRUE
  ELSE
    IF D1.Mo > D2.Mo
      THEN
        Less := FALSE
      ELSE {D1.Mo = D2.Mo}
        Less := (D1.Day < D2.Day)
  END; {Less}
 
  PROCEDURE CopyOut(VAR DateFile: FileOfDate);
  {DateFile => OUTPUT/}
  VAR
    VarDate: Date;
  BEGIN {CopyOut}
    WHILE NOT EOF(DateFile)
    DO
      BEGIN
        READ(DateFile, VarDate);
        WriteDate(OUTPUT, VarDate);
        WRITELN(OUTPUT)
      END
  END; {CopyOut}

  PROCEDURE CopyDate(VAR DFile1, DFile2: FileOfDate);
  VAR
    VDate: Date;
  BEGIN {CopyDate}
    WHILE NOT EOF(DFile1)
    DO
      BEGIN
        READ(DFile1, VDate);
        WRITE(DFile2, VDate)
      END;
  END; {CopyDate}
  
BEGIN
END.

