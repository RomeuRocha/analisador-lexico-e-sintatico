package src;
%%
%public
%class ScannerJFlex

%{

private void imprimir(String descricao, String lexema) {
    System.out.println(lexema + " - " + descricao);
}

%%
[ \n\t] { }
[0-9]+ { imprimir("Palavra reservada if", yytext()); }
print { imprimir("Palavra reservada if", yytext()); }
[a-zA-Z]+ { imprimir("Palavra reservada if", yytext()); }
[+]|[-]|;|[(]|[)]|[=] { imprimir("Palavra reservada if", yytext()); }
<<EOF>> { imprimir("Palavra reservada if", yytext()); }
. { throw new RuntimeException("caractere inválido "+yytext()); }