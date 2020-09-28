package src;

import java.io.IOException;
import java.io.StringReader;

public class TestaAL {

	public static void main(String[] args) throws IOException {
		String expr = "if 2 + 3+a*5/4-16 then";

        AnalisadorLexico lexical = new AnalisadorLexico(new StringReader(expr));
        lexical.yylex();
	}

}
