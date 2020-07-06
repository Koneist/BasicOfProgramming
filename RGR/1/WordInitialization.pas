UNIT WordInitializationUnit;
INTERFACE
  USES
    ConstUnit;
    
  FUNCTION ReadWord(VAR FIn: TEXT): WordString; //—читывает слово из файла
IMPLEMENTATION

  FUNCTION ChToLower(VAR Ch: CHAR): CHAR;
  BEGIN {ChToLower}
    IF (Ch = '®') OR (Ch = 'Є')
    THEN
      ChToLower := 'e'
    ELSE
      IF (Ch IN EngLowerSymb) OR (Ch IN RusLowerSymb)
      THEN
        ChToLower := Ch
      ELSE
        IF (Ch IN EngUpperSymb) OR (Ch IN RusUpperSymb)
        THEN
          ChToLower := CHR(ORD(Ch) + ChToLowerRange)
  END; {ChToLower}
  
  FUNCTION ReadWord(VAR FIn: TEXT): WordString;
  VAR 
    CurrWord: WordString;
    Ch: CHAR;
  BEGIN {ReadWord}
    CurrWord := '';
    Ch := '';
    WHILE (NOT EOLN(FIn)) AND ((Ch IN ValidCh) OR (CurrWord = ''))
    DO
      BEGIN
        READ(FIn, Ch);
        IF (Ch IN ValidCh)
        THEN  
          CurrWord := CurrWord + ChToLower(Ch)
      END;
    IF EOLN(FIn)
    THEN
      READLN(FIn);  
    ReadWord := CurrWord  
  END; {ReadWord}
BEGIN  
END.
