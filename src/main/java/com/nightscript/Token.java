package com.nightscript;


enum TokenType {
  /** + */
  ADD_OP,

  /** - */
  SUBTRACT_OP,

  /** * */
  MULTIPLY_OP,

  /** | */
  OR_OP,

  /** & */
  AND_OP,

  /** ! */
  LOGICAL_NOT_OP,

  /** = */
  EQUAL_OP,

  /** < */
  LESS_THAN_OP,

  /** > */
  GREATER_THAN_OP,

  /** / */
  FORWARD_SLASH,

  /** \ */
  BACKWARD_SLASH,

  TEXT,

  /** Any quoted text */
  STRING,

  /** Hex and decimal numbers */
  NUMBER,
  
  WHITESPACE,
  OPENING_PARENTHESIS,
  CLOSING_PARENTHESIS,
  OPENING_SQUARE_BRACKET,
  CLOSING_SQUARE_BRACKET,
  COMMA,
}


/**
 * A Token is the basic unit if instruction in the abstract syntax tree.
 * 
 * A Token has a type, the actual data for the token, and a zero based index
 * where the token starts in the line its in.
 * 
 * The data for quoted string tokens is stored with the quotes quotes. In fact,
 * the data for all token types is stored as is found in the input source file.
 * No conversions, trimmings, etc are done.
 * 
 * @see com.nightscript.TokenType
 * @see com.nightscript.StatementTokeniser
 */
public class Token {
  public final TokenType type;
  public final String data;
  public final int startIndexInLine;

  public Token(TokenType type, String data, int startIndexInLine) {
    this.type = type;
    this.data = data;
    this.startIndexInLine = startIndexInLine;
  }

  @Override
  public boolean equals(Object o) {
    if (!(o instanceof Token))
      return false;

    final Token other = (Token) o;
    return other.type == this.type && other.data.equals(this.data) && other.startIndexInLine == this.startIndexInLine;
  }

  @Override
  public String toString() {
    return String.format("{type: %s, data: %s, startIndexInLine: %d}", type.toString(), data, startIndexInLine);
  }
}
