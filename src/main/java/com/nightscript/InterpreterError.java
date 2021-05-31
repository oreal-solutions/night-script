package com.nightscript;

public class InterpreterError extends Throwable {
    final String message;
    final Line line;

    public InterpreterError(String message, Line line){
        super(message);
        this.message = message;
        this.line = line;
    }
}