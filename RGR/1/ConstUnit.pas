Unit ConstUnit;
INTERFACE
  TYPE
    WordString = STRING(50);
    Tree = ^NodeType;
    NodeType = RECORD
                 CurrWord: WordString;
                 CounterWord: INTEGER;
                 LLink, RLink: Tree
               END;
  CONST
    FInRoute = 'Input.txt';
    FOutRoute = 'Output.txt';
    UpperSymb = ['A'..'Z', '�'..'�', '�'];
    LowerSymb = ['a'..'z', '�'..'�', '�'];
    ValidCh = UpperSymb + LowerSymb;
    ChToLowerRange = 32;
IMPLEMENTATION

BEGIN
END. 
