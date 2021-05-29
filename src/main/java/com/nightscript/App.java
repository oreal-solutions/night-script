package com.nightscript;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.List;
import java.util.Scanner;

/**
 * Main Application to run langauge!
 *
 */
public class App 
{
    private static File script;
    private static Scanner reader;
    private static List<Line> lines;
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
     * @param line
     */
    private static void handleLine(Line line){

    }
}
