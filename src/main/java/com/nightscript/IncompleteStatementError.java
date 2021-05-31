package com.nightscript;

/**
 * An Error thrown when a statement is not complete, i.e it does not contain all
 * the expected tokens.
 */
public class IncompleteStatementError extends InterpreterError {
    public IncompleteStatementError(Line line, String suggestedFix) {
        super(String.format("The statement at line %d is incomplete\n\n %s", line.lineNumber, suggestedFix), line);
    }
}
