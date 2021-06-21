package com.nightscript;

import java.util.concurrent.Callable;

/**
 * A value object kepps the data of an identifier.
 * 
 * Operations can be performed on a Value object.
 * 
 * @see com.nightscript.ValueOperations
 */
public abstract class Value<T> implements Comparable<Value<T>>{
  protected final T data;
  public Value(T data){
    this.data = data;
  }

  public static class Boolean extends Value<java.lang.Boolean> {
    public Boolean(boolean data){
      super(data);
    }

    @Override
    public int compareTo(Value<java.lang.Boolean> o) {
      return data.compareTo(o.data);
    }
  
  }
  public static class Byte extends Value<java.lang.Byte> {
    public Byte(byte data){
      super(data);
    }

    @Override
    public int compareTo(Value<java.lang.Byte> o) {
      return data.compareTo(o.data);
    }
  }
  
  public static class Number extends Value<java.lang.Double> {
    public Number(double data){
      super(data);
    }

    @Override
    public int compareTo(Value<java.lang.Double> o) {
      return data.compareTo(o.data);
    }
  }

  public static class String extends Value<java.lang.String> {
    public String(java.lang.String data){
      super(data);
    }

    @Override
    public int compareTo(Value<java.lang.String> o) {
      return data.compareTo(o.data);
    }
  }

  public static class Array extends Value<Value<?>[]> {
    public Array(Value<?>[] data){
      super(data);
    }

    @Override
    public int compareTo(Value<Value<?>[]> o) {
      return 0;
    }
  }

  public static class Function extends Value<Callable<Value<?>>> {
    public Function(Callable<Value<?>> data){
      super(data);
    }

    @Override
    public int compareTo(Value<Callable<Value<?>>> o) {
      return 0;
    }
  }
}
