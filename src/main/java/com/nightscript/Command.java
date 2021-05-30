package com.nightscript;

/**
 * Class that takes in a Line class and determines the Line's KEYWORDS, OPERATORS VARIABLES, etc.
 */
public class Command {
    String[] command;
    KEYWORD keyword;
    
    public Command(Line line) {
        this.command = line.lineContent.split(" "); 
    }

    /**
     * Enum Class to store command keyword
     * KEYWORD keyword = KEYWORD.let;  
     */
    enum KEYWORD {
       let,
       print,
       def,
       forEach,
       endForEach,
       For,
       endFor,
       If,
       endIf
   }

   /**
    * Method to run functions depending on keyword
    */
    public static void KeyExecute(KEYWORD keyword, int lineNumber) {
        switch (keyword){
            case let:
                //LetStatementExecutor
                break;
            case print:
                //PrintStatementExecutor
                break;
            case def:
                //DefStatementExecutor
                break;
            case forEach:
                //ForEachStatementExecutor
                break;
            case endForEach:
                //EndForEachStatementExecutor
                break;
            case For:
                //ForStatementExecutor
                break;
            case endFor:
                //EndForStatementExecutor
                break;
            case If:
                //IfStatementExecutor
                break;
            case endIf:
                //EndIfStatementExecutor
                break;
        }
    }
}
