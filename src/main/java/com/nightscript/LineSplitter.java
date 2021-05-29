package com.nightscript;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * LineSplitter class to open program file content and split it into lines
 * returns lines as a list. 
 */
public class LineSplitter {
    List<Line> lines;
    List<String> rawLines;

    /**
     * Contructor to create empty arraylists.
     * 
     * @param file program file
     */
    public LineSplitter() {
        lines = new ArrayList<Line>();
        rawLines = new ArrayList<String>();
    }

    /**
     * Method to read program file and return every line as a Line class and add to lines array
     * 
     * @return lines Array of program file lines
     */
    public List<Line> getLines(String fileContent) {
        int num = 1;
        rawLines = Arrays.asList(fileContent.split("\n"));
        if (!(rawLines.get(0).equals(""))){
            for (String line : rawLines) {
                Line l = new Line(num, line);
                lines.add(l);
                num++;
            }        
        }
        return lines;
    }
}
