package com.nightscript;

import java.util.HashMap;
import java.util.Map;

public class Context {
    private Map<String, Value> variables = new HashMap<String, Value>();

    public boolean doesVariableExist(String name) {
        return variables.containsKey(name);
    }

    public void setVariableValue(String name, Value value) {
        variables.put(name, value);
    }

    public Value getVariableValue(String name) {
        return variables.get(name);
    }

}
