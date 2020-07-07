PROGRAM CountWords(INPUT, OUTPUT);

USES
  ConstUnit,
  WordInitializationUnit,
  WordSortUnit;  

VAR
  FIn, FOut: TEXT;
  
PROCEDURE GetStatistic(VAR FIn, FOut: TEXT);
VAR
  Root: Tree;
BEGIN {GetStatistic}
  Root := NIL;
  RESET(FIn);
  REWRITE(FOut);
  WHILE NOT EOF(FIn)
  DO
    Insert(Root, ReadWord(FIn));
  PrintScore(Root, FOut);
  PrintTree(Root, FOut);
  EraseTree(Root)
END; {GetStatistic}

BEGIN {CountWords}
  ASSIGN(FIn, FInRoute);
  ASSIGN(FOut, FOutRoute);
  GetStatistic(FIn, FOut)
END. {CountWords}
