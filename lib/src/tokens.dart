part of night_script;

/// A Token is a unit of meaning in a source file.
///
/// There are 5 different types of tokens in nightScript:
/// 1. Identifier: Names the programmer chooses, i.e tokens that cannot be
///    identified as the other tokens
/// 2. Keyword: Any night script keyword
/// 3. Separator: newlines and punctuation characters used for separating
///               regions of code
/// 4. Operator: Symbols that operate on arguments and produce results
/// 5. Literal: Program literals
/// 6. Comment: Line comments and block comments
class Token {
  /// This is a zero based index of where the first character of the token is in
  /// in the file.
  final int startIndex;

  /// startIndex + data.length
  ///
  /// i.e exclusive end index.
  final int endIndex;

  /// The string this token was passed from in the source file.
  final String data;

  int lineNumber;

  final TokenType type;

  Token(this.startIndex, this.lineNumber, this.data, this.type)
      : endIndex = startIndex + data.length;

  void setComputedLineNumber(int value) {
    lineNumber = value;
  }

  @override
  bool operator ==(other) {
    return other is Token &&
        other.startIndex == startIndex &&
        other.endIndex == endIndex &&
        other.data == data &&
        other.lineNumber == lineNumber &&
        other.type == type;
  }

  @override
  int get hashCode =>
      startIndex.hashCode ^ data.hashCode ^ type.hashCode ^ endIndex.hashCode;

  @override
  String toString() =>
      '($type, $data, @$startIndex-$endIndex line $lineNumber)';
}

enum TokenType {
  identifier,
  unknown,

  // Keywords
  importKeyword,
  asKeyword,
  isKeyword,
  inKeyword,
  ifKeyword,
  elseKeyword,
  forKeyword,
  whileKeyword,
  takesKeyword,
  andKeyword,
  trueKeyword,
  falseKeyword,
  letKeyword,
  finalKeyword,
  functionKeyword,
  futureKeyword,
  boolKeyword,
  numKeyword,
  intKeyword,
  anyKeyword,
  typeKeyword,
  stringKeyword,
  listKeyword,
  mapKeyword,
  enumKeyword,
  voidKeyword,
  structKeyword,
  withKeyword,
  thisKeyword,
  tryKeyword,
  onKeyword,
  getKeyword,
  catchKeyword,
  throwKeyword,
  breakKeyword,
  continueKeyword,
  asyncKeyword,
  awaitKeyword,
  operatorKeyword,

  // Separators
  dot,
  comma,
  colon,
  newline,
  semicolon,
  openParenthesis,
  closeParenthesis,
  openSquareBracket,
  closeSquareBracket,
  openBrace,
  closeBrace,

  // Arithmatic operators
  opAdd,
  opSubtract,
  opMultiply,
  opDivide,
  opModulus,
  opIncrement, // ++
  opDecrement, // --

  // Logical Operators
  opAnd, // &&
  opOr, // ||
  opNot, // !

  // Relational Operators
  opEqualTo, // ==
  opNotEqualTo, // !=
  opLessThan, // <
  opGreaterThan, // >
  opLessThanOrEqualTo, // <=
  opGreaterThanOrEqualTo, // >=

  // Assignment operators
  opAssign, // =
  opAddAssign, // +=
  opSubtractAssign, // -=
  opMultiplyAssign, // *=
  opDivideAssign, // /=
  opModulusAssign, // %=

  // Other operators
  opIsNot, // is!
  dataTypeOr, // |

  // Literals
  stringLiteral, // single line or multi line string with quotes
  numberLiteral, // xxx.y OR xxxey
  integerLiteral, // xx OR 0xXX

  // Comments
  lineComment, // "//""
  docComment, // "///"
}

final _keywordTokens = {
  'import': TokenType.importKeyword,
  'as': TokenType.asKeyword,
  'is': TokenType.isKeyword,
  'in': TokenType.inKeyword,
  'if': TokenType.ifKeyword,
  'else': TokenType.elseKeyword,
  'for': TokenType.forKeyword,
  'while': TokenType.whileKeyword,
  'takes': TokenType.takesKeyword,
  'and': TokenType.andKeyword,
  'true': TokenType.trueKeyword,
  'false': TokenType.falseKeyword,
  'let': TokenType.letKeyword,
  'final': TokenType.finalKeyword,
  'function': TokenType.functionKeyword,
  'future': TokenType.futureKeyword,
  'bool': TokenType.boolKeyword,
  'num': TokenType.numKeyword,
  'int': TokenType.intKeyword,
  'any': TokenType.anyKeyword,
  'type': TokenType.typeKeyword,
  'string': TokenType.stringKeyword,
  'list': TokenType.listKeyword,
  'map': TokenType.mapKeyword,
  'enum': TokenType.enumKeyword,
  'void': TokenType.voidKeyword,
  'struct': TokenType.structKeyword,
  'with': TokenType.withKeyword,
  'this': TokenType.thisKeyword,
  'try': TokenType.tryKeyword,
  'on': TokenType.onKeyword,
  'get': TokenType.getKeyword,
  'catch': TokenType.catchKeyword,
  'throw': TokenType.throwKeyword,
  'break': TokenType.breakKeyword,
  'continue': TokenType.continueKeyword,
  'async': TokenType.asyncKeyword,
  'await': TokenType.awaitKeyword,
  'operator': TokenType.operatorKeyword,
};

// Strings will be matched literally and RegExps will be be matched accordingly
final _lexemeMatchers = {
  // Number literal
  // xx.yy (Ezz.aa)
  // optional part is xx and (Ezz.aa)
  //
  // 5.6 will match
  // 5.6E45 will match
  // .5 will match
  // .005E will only match .005 and not E
  // 456 will not match
  RegExp(r'\d*\.\d*E?\d+'): TokenType.numberLiteral,

  // Hex Integers
  RegExp(r'0x[0-9a-fA-F]+'): TokenType.integerLiteral,

  // Identifier
  // We match them before integer digits since identifiers can have digits in
  // them
  RegExp(r'[a-zA-Z_][a-zA-Z0-9_]*'): TokenType.identifier,

  // Digits Interger literal
  // 456 will match
  // 0x44ff will match
  RegExp(r'\d+'): TokenType.integerLiteral,

  // Other operators
  RegExp(r'is!'): TokenType.opIsNot,
};

const _oneCharacterTokens = {
  // Separators
  '.': TokenType.dot,
  ',': TokenType.comma,
  ':': TokenType.colon,
  '\n': TokenType.newline,
  ';': TokenType.semicolon,
  '(': TokenType.openParenthesis,
  ')': TokenType.closeParenthesis,
  '[': TokenType.openSquareBracket,
  ']': TokenType.closeSquareBracket,
  '{': TokenType.openBrace,
  '}': TokenType.closeBrace,

  // Arithmatic operators
  '+': TokenType.opAdd,
  '-': TokenType.opSubtract,
  '*': TokenType.opMultiply,
  '/': TokenType.opDivide,
  '%': TokenType.opModulus,

  // Logical Operators
  '!': TokenType.opNot,

  // Relational Operators
  '<': TokenType.opLessThan,
  '>': TokenType.opGreaterThan,

  // Assignment operators
  '=': TokenType.opAssign,

  // Other operators
  '|': TokenType.dataTypeOr,
};

const _twoCharacterTokens = {
  // Arithmatic operators
  '++': TokenType.opIncrement,
  '--': TokenType.opDecrement,

  // Logical Operators
  '&&': TokenType.opAnd,
  '||': TokenType.opOr,

  // Relational Operators
  '==': TokenType.opEqualTo,
  '!=': TokenType.opNotEqualTo,
  '<=': TokenType.opLessThanOrEqualTo,
  '>=': TokenType.opGreaterThanOrEqualTo,

  // Assignment operators
  '+=': TokenType.opAddAssign,
  '-=': TokenType.opSubtractAssign,
  '*=': TokenType.opMultiplyAssign,
  '/=': TokenType.opDivideAssign,
  '%=': TokenType.opModulusAssign,
};
