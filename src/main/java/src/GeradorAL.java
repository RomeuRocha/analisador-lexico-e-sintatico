package src;

import java.nio.file.Paths;

public class GeradorAL {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String rootPath = Paths.get("").toAbsolutePath().toString();
		String subPath = "/src/main/java/src/";

		String file[] = {rootPath+subPath + "lexer.lex"};

		jflex.Main.main(file);
		
	}

}
