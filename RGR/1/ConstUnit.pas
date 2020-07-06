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
    RusUpperSymb = ['À'..'ß'];
    RusLowerSymb = ['à'..'ÿ'];
    EngUpperSymb = ['A'..'Z'];
    EngLowerSymb = ['a'..'z'];
    ValidCh = RusUpperSymb + RusLowerSymb + EngUpperSymb + EngLowerSymb + ['¨', '¸'];
    ChToLowerRange = 32;
IMPLEMENTATION

BEGIN
END. 
