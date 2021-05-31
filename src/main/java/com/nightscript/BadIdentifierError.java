package com.nightscript;

public class BadIdentifierError extends InterpreterError {
    public BadIdentifierError(Line line, String identifierName, String suggestedFix) {
        super(String.format("'%s' is a bad identifier.\n\n%s", identifierName), line);
    }
}
