package com.nightscript;

/**
 * A line represents a single statement as a string.
 */
public class Line {
  final public int lineNumber;
  final public String lineContent;

  public Line(int lineNumber, String lineContent) {
    this.lineNumber = lineNumber;
    this.lineContent = lineContent;
  }

  @Override
  public boolean equals(Object o) {
    if (!(o instanceof Line))
      return false;

    final Line other = (Line) o;
    return other.lineNumber == this.lineNumber && other.lineContent.equals(this.lineContent);
  }

  @Override
  public String toString() {
    return String.format("{lineNumber: %d, lineContent: %s}", lineNumber, lineContent);
  }
}
