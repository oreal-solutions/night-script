package com.nightscript;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

import com.nightscript.Command.KEYWORD;

/**
 * Main Application to run langauge!
 *
 */
public class App 
{
    private static File script;
    private static Scanner reader;
    private static List<Line> lines;
    private static Command command;
    private static Context context;
    private static ExpressionSolver solver;
    public static void main( String[] args ) throws FileNotFoundException
    {
        System.out.println( "Welcome to NightScript!" );
        // OPENING FILE 
        script = new File(args[0]);
        reader = new Scanner(script);
        String content = "";
        while (reader.hasNextLine()){
            content.concat(reader.nextLine());
        }
        lines = new LineSplitter().getLines(content); 
        
        // Main loop to run program line by line.
        for (Line line : lines){
            handleLine(line);
        }
    }

    /**
     * Master method to evaluate each line and decides what happens to it
     * 
     * @param line command that needs to be executed
     */
    private static void handleLine(Line line){
        // Split the line contents into list of words. command = [let, a, =, 4]
        command = new Command(line);
        solver = new ExpressionSolver();  

        // If command starts with a keyword
        for (KEYWORD key : KEYWORD.values()){
            if (key.name().equals(command.command[0])){
                command.keyword = key;
            }
        }
        // Execute keyword command
        if (command.keyword != null){
            Command.KeyExecute(command, line.lineNumber);
        }
        // If command doesn't start with keyword
        // eg. Updating a variable, a = 34
        else if (context.doesVariableExist(command.command[0])){
            List<String> expression = Arrays.asList(line.lineContent.substring(line.lineContent.indexOf("=")+1).split(" "));
            Value value = solver.solve(expression, line.lineNumber);
            context.setVariableValue(command.command[0], value);
        }
    }
}
