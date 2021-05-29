package com.nightscript;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

/**
 * Unit test for LineSplitter Class
 */
public class LineSplitterTest {
    LineSplitter lineSplitter;
   
    /**
    * Test for when file content is empty
    */
    @Test
    public void testIfEmpty(){
        lineSplitter = new LineSplitter();
        assertEquals(0, lineSplitter.getLines("").size());     
    }

    /**
     * Test for when file has 1 line
     */
    @Test
    public void testIfOneLine(){
        lineSplitter = new LineSplitter();
        assertEquals(1, lineSplitter.getLines("let a = readNumber\n").size());
    }
    
    /**
     * Test for when file has 2 line
     */
    @Test
    public void testIfTwoLines(){
        lineSplitter = new LineSplitter();
        assertEquals(2, lineSplitter.getLines("let a = readNumber\n let b = readNumber\n").size());
    }


    /**
     * Test for when file has 5 line
     */
    @Test
    public void testIfFiveLines(){
        lineSplitter = new LineSplitter();
        assertEquals(5, lineSplitter.getLines("let a = readNumber\n let b = readNumber\n let sum = a + b\n print \"yebo yebo\"\n boolean success = True\n").size());
    }
}

