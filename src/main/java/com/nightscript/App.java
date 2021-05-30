package com.nightscript;

import java.io.File;
import java.io.FileNotFoundException;
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

        // If command starts with a keyword
        for (KEYWORD key : KEYWORD.values()){
            if (key.name().equals(command.command[0])){
                command.keyword = key;
            }
        }
        // Execute keyword command
        Command.KeyExecute(command.keyword);
    }
}
