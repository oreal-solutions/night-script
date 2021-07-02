part of night_script;

/// A Token is a unit of meaning in a source file.
///
/// There are 5 different types of tokens in nightScript:
/// 1. Identifier: Names the programmer chooses, i.e tokens that cannot be
///    identified as the other tokens
/// 2. Keyword: Any night script keyword
/// 3. Separator: Punctuation characters used for separating regions of code
/// 4. Operator: Symbols that operate on arguments and produce results
/// 5. Literal: Program literals
/// 6. Comment: Line comments and block comments
class Token {
  /// This is a zero based index of where the first character of the token is in
  /// in the file.
  final int startIndex;

  /// The string this token token was passed from in the source file.
  final String data;

  final TokenType type;

  Token(this.startIndex, this.data, this.type);

  @override
  bool operator ==(other) {
    return other is Token &&
        other.startIndex == startIndex &&
        other.data == data &&
        other.type == type;
  }

  @override
  int get hashCode => startIndex.hashCode ^ data.hashCode ^ type.hashCode;

  @override
  String toString() => '($type, $data, @$startIndex)';
}

enum TokenType {
  identifier,

  // Keywords
  includeKeyword,
  asKeyword,
  defKeyword,
  endDefKeyword,
  inKeyword,
  ifKeyword,
  elseKeyword,
  endIfKeyword,
  forEachKeyword,
  endForEachKeyword,
  takesKeyword,
  andKeyword,
  returnKeyword,
  trueKeyword,
  falseKeyword,
  letKeyword,
  finalKeyword,
  functionKeyword,
  booleanKeyword,
  byteKeyword,
  numberKeyword,
  stringKeyword,
  listKeyword,
  mapKeyword,
  structKeyword,
  withKeyword,
  hasKeyword,
  dataKeyword,
  tryKeyword,
  onKeyword,
  getKeyword,
  catchKeyword,
  throwKeyword,
  breakKeyword,
  continueKeyword,

  // Separators
  dot,
  comma,
  colon,
  openParenthesis,
  closeParenthesis,
  openSquareBracket,
  closeSquareBracket,

  // Arithmatic operators
  opAdd,
  opSubtract,
  opMultiply,
  opDivide,
  opModulus,
  opIncrement,
  opDecrement,

  // Logical Operators
  opAnd,
  opOr,
  opNot,

  // Relational Operators
  opEqualTo,
  opNotEqualTo,
  opLessThan,
  opGreaterThan,
  opLessThanOrEqualTo,
  opGreaterThanOrEqualTo,

  // Assignment operators
  opAssign,
  opAddAssign,
  opSubtractAssign,
  opMultiplyAssign,
  opDivideAssign,
  opModulusAssign,

  // Others operators
  opIsNot,
  opLambda,

  // Literals
  stringLiteral, //single line or multi line string with quotes
  numberLiteral,

  // Comments
  lineComment,
  blockComment,
}

abstract class Lexer {
  /// Tokenises the given source.
  ///
  /// A lexeme that cannot be matched to any token is treated as an identifier
  /// even if it is not a valid identifier according to the rules of night
  /// script. The following stages of parsing will apply the rules. In this
  /// stage we are just tokenisisng.
  List<Token> tonekise(String source);

  factory Lexer() = _Lexer;
}

class _Lexer implements Lexer {
  @override
  List<Token> tonekise(String source) {
    return [];
  }
}
