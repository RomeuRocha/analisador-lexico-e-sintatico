package src.sintatico;

import java.io.FileReader;
import java.nio.file.Paths;

public class TestaAS {

	public static void main(String[] args) {
		String rootPath = Paths.get("").toAbsolutePath().toString();
        String subPath = "/src/main/java/src/sintatico/";

        String sourcecode = rootPath + subPath + "Program.pg";
       
        
        try {
        	
            parser p = new parser(new Lexer(new FileReader(sourcecode)));
            Object result = p.parse().value;
            System.out.println("Compilacao concluida com sucesso...");
        } catch (Exception e) {
            e.printStackTrace();
        }
		
		
	}

}
