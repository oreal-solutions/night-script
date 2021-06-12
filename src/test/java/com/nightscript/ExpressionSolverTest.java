package com.nightscript;

import static com.nightscript.ExpressionSolver.eval;
import static org.junit.Assert.assertEquals;

import org.junit.Test;

/**
 * Unit Test to Test Expression Solver class
 */
public class ExpressionSolverTest {

    /**
     * Testing solve method
     */
    @Test
    public void testSolve(){
        
    }

    /**
     * Testing Math expressions eval function
     */
    @Test
    public void testEval() {
        // Expression Tests
        // simple operations
        String exp1 = "184+41";
        String exp2 = "21321-6762";
        String exp3 = "675 * 3";
        String exp4 = "130 / 10";
        // combined operations
        String exp5 = "123 + 76325 - 6621";
        String exp6 = "672384 - 78623 * 23457 + 3";
        String exp7 = "3123 / 76632 * 32";
        String exp8 = "(21 + 6) / 5 + (4 * 31)";
        String exp9 = "(88 - 21 / 5) * 9 ";
        String exp10 = "10 / 9 * 7 / (-2)";
        // By zero  
        String exp11 = "10 / 0";
        String exp12 = "10 * 0";
        String exp13 = "10 - 0";
        String exp14 = "10 + 0";
        // Negative number
        String exp15 = "10 + -1";
        String exp16 = "10 - -1";
        String exp17 = "10 * -1";
        String exp18 = "10 / -1";

        // TESTS
        assertEquals(225, eval(exp1), 5);
        assertEquals(14559, eval(exp2), 5);
        assertEquals(2025, eval(exp3), 5);
        assertEquals(13, eval(exp4), 5);
        assertEquals(69827, eval(exp5), 5);
        assertEquals(-1843587324, eval(exp6), 5);
        assertEquals(1.30410, eval(exp7), 5);
        assertEquals(129.4, eval(exp8), 5);
        assertEquals(754.2, eval(exp9), 5);
        assertEquals(-3.88889, eval(exp10), 5);
        assertEquals(Double.POSITIVE_INFINITY, eval(exp11), 5);
        assertEquals(0, eval(exp12), 5);
        assertEquals(10, eval(exp13), 5);
        assertEquals(10, eval(exp14), 5);
        assertEquals(9, eval(exp15), 5);
        assertEquals(11, eval(exp16), 5);
        assertEquals(-10, eval(exp17), 5);
        assertEquals(-10, eval(exp18), 5);
    }
    
}
