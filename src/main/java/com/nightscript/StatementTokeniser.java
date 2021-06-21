package com.nightscript;

import java.util.ArrayList;
import java.util.List;

/**
 * A StatementTokeniser converts a single statement into a list of tokens.
 * 
 * A statement to be tokenised should be given in the form of a line.
 * 
 * A StatementTokeniser should only be used to tokenise statements from a single
 * source file. Multiple tokenisers should be created to tokenise statements
 * from multiple files.
 * 
 * @see com.nightscript.Token
 * @see com.nightscript.Line
 */
public abstract class StatementTokeniser {
  public abstract List<Token> tokenise(Line statment);

  /**
   * Returns a statement tokeniser for statements of the file with the given name.
   * 
   * The fileName is used for errors.
   */
  public static StatementTokeniser makeTokeniserForFile(String fileName) {
    return new StatementTokeniserImpl(fileName);
  }
}

class StatementTokeniserImpl extends StatementTokeniser {
  public StatementTokeniserImpl(String fileName) {
  }

  @Override
  public List<Token> tokenise(Line statment) {
    return new ArrayList<>();
  }
}
