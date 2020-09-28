package src.sintatico;

import java_cup.runtime.Symbol;

%%

%cup
%public
%class Lexer
%line
%column


DIGIT = [0-9]
LETTER = [a-zA-Z_]
COMMENT = \|\|.*\n
STRING = \~{LETTER}+\~
INTEGER = {DIGIT}+
VARIABLE = @{LETTER}+
ASSIGNMENT = \${LETTER}+
FUNCTION = &{LETTER}+
FUNCTION_PARAMS = \^{LETTER}+ 
CALL_FUNCTION = %{LETTER}+
IGNORE = [\n|\s|\t\r]

%%

<YYINITIAL> {

    "program"       {return new Symbol(sym.PROGRAM); }
    "if"            {return new Symbol(sym.IF); }

    "<{"            {return new Symbol(sym.BEGIN); }
    "}>"            {return new Symbol(sym.END); }

    "INT"           {return new Symbol(sym.INTEGER_TYPE); }
    "STR"           {return new Symbol(sym.INTEGER_TYPE); }

    ":"             {return new Symbol(sym.COLON); }
    "("             {return new Symbol(sym.LEFT_PARAMETER); }
    ")"             {return new Symbol(sym.RIGHT_PARAMETER); }    
    "["             {return new Symbol(sym.LEFT_BRACKETS); }
    "]"             {return new Symbol(sym.RIGHT_BRACKETS); }    

    ";"             {return new Symbol(sym.SEMICOLON); }

    "TT"            {return new Symbol(sym.TT); }
    "FF"            {return new Symbol(sym.FF); }

    "->"            {return new Symbol(sym.SYMBOL_ASSIGNMENT); }

    {CALL_FUNCTION} {return new Symbol(sym.CALL_FUNCTION); }

    {ASSIGNMENT}    {return new Symbol(sym.ASSIGNMENT); }

    {STRING}        {return new Symbol(sym.STRING); }
    {INTEGER}       {return new Symbol(sym.INTEGER); }  


    {FUNCTION}      {return new Symbol(sym.FUNCTION); }

    {FUNCTION_PARAMS}   {return new Symbol(sym.FUNCTION_PARAMS); }

    {VARIABLE}      {return new Symbol(sym.VARIABLE); }

    {IGNORE}        {}
    {COMMENT}       {}

}

<<EOF>> { return new Symbol( sym.EOF ); }


[^] { throw new Error("Illegal character: "+yytext()+" at line "+(yyline+1)+", column "+(yycolumn+1) ); }