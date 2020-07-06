UNIT WordSortUnit;
INTERFACE
  USES
    ConstUnit;

  PROCEDURE Insert(VAR Ptr: Tree; TempWord: WordString); //вставка слова в дерево
  PROCEDURE PrintScore(VAR Ptr: Tree; VAR FOut: TEXT);   //Печать числа слов
  PROCEDURE PrintTree(VAR Ptr: Tree; VAR FOut: TEXT);    //Печать дерева
  PROCEDURE EraseTree(VAR Ptr: Tree);                    //очистка дерево
IMPLEMENTATION
  PROCEDURE Insert(VAR Ptr: Tree; TempWord: WordString);
  BEGIN {Insert}
    IF TempWord <> ''
    THEN
      IF Ptr = NIL
      THEN
        BEGIN 
          NEW(Ptr);
          Ptr^.CurrWord := TempWord;
          Ptr^.CounterWord := 1;
          Ptr^.LLink := NIL;
          Ptr^.RLink := NIL
        END
      ELSE
        IF TempWord < Ptr^.CurrWord
      THEN
        Insert(Ptr^.LLink, TempWord)
      ELSE
        IF TempWord > Ptr^.CurrWord
        THEN
          Insert(Ptr^.RLink, TempWord)
        ELSE
          Ptr^.CounterWord := Ptr^.CounterWord + 1
  END; {Insert}
  
  PROCEDURE PrintTree(VAR Ptr: Tree; VAR FOut: TEXT);
  BEGIN {PrintTree}
    IF Ptr <> NIL
    THEN
      BEGIN
        PrintTree(Ptr^.LLink, FOut); 
        WRITELN(FOut, Ptr^.CurrWord, ' ', Ptr^.CounterWord);
        PrintTree(Ptr^.RLink, FOut)
      END
  END; {PrintTree}
  
  PROCEDURE EraseTree(VAR Ptr: Tree);
  BEGIN {EraseTree}
    IF Ptr <> NIL
    THEN
      BEGIN
        EraseTree(Ptr^.LLink);
        EraseTree(Ptr^.RLink)
      END;
    DISPOSE(Ptr)
  END; {EraseTree}
  
  PROCEDURE GetScore(VAR Score: INTEGER; VAR Ptr: TREE);
  VAR
    CurrScore: INTEGER;
  BEGIN {GetScore}
    Score := 0;
    CurrScore := 0;
    IF Ptr <> NIL
    THEN
      BEGIN
        Score := Ptr^.CounterWord;
        GetScore(CurrScore, Ptr^.LLink);
        Score := Score + CurrScore;
        GetScore(CurrScore, Ptr^.RLink);
        Score := Score + CurrScore
      END
  END; {GetScore}
  
  PROCEDURE PrintScore(VAR Ptr: Tree; VAR FOut: TEXT);
  VAR
    Score: INTEGER;
  BEGIN {PrintScore}
    GetScore(Score, Ptr);
    WRITELN(FOut, 'Global Score: ', Score)
  END; {PrintScore}
BEGIN
END.
