import 'package:night_script/night_script.dart';
import 'package:test/test.dart';

final allLexemes = '''identifier1
_identifier2
##identifier3

include
as
def
endDef
in
if
else
endIf
forEach
endForEach
takes
and
return
true
false
let
final
function
boolean
byte
number
string
list
map
struct
with
has
data
try
on
get
catch
throw
break
continue

.
,
:
(
)
[
]

+
-
*
/
%
++
--

&&
||
!

==
!=
<
>
<=
>=

=
+=
-=
*=
/=
%=

"myString"
"""my String

continues till here"""
45
0.78
.78
0x78

// This is a line comment
/// This is a block comment
/// And it continues till here
/// and here
''';

final expectedTokensIgnoringStartingIndices = [
  Token(-1, 'identifier1', TokenType.identifier),
  Token(-1, '_identifier2', TokenType.identifier),
  Token(-1, '##identifier3', TokenType.identifier),

  // Keywords
  Token(-1, 'include', TokenType.includeKeyword),
  Token(-1, 'as', TokenType.asKeyword),
  Token(-1, 'def', TokenType.defKeyword),
  Token(-1, 'endDef', TokenType.endDefKeyword),
  Token(-1, 'in', TokenType.inKeyword),
  Token(-1, 'if', TokenType.ifKeyword),
  Token(-1, 'else', TokenType.elseKeyword),
  Token(-1, 'endIf', TokenType.endIfKeyword),
  Token(-1, 'forEach', TokenType.forEachKeyword),
  Token(-1, 'endForEach', TokenType.endForEachKeyword),
  Token(-1, 'takes', TokenType.takesKeyword),
  Token(-1, 'and', TokenType.andKeyword),
  Token(-1, 'return', TokenType.returnKeyword),
  Token(-1, 'true', TokenType.trueKeyword),
  Token(-1, 'false', TokenType.falseKeyword),
  Token(-1, 'let', TokenType.letKeyword),
  Token(-1, 'final', TokenType.finalKeyword),
  Token(-1, 'function', TokenType.functionKeyword),
  Token(-1, 'boolean', TokenType.booleanKeyword),
  Token(-1, 'byte', TokenType.byteKeyword),
  Token(-1, 'number', TokenType.numberKeyword),
  Token(-1, 'string', TokenType.stringKeyword),
  Token(-1, 'list', TokenType.listKeyword),
  Token(-1, 'map', TokenType.mapKeyword),
  Token(-1, 'struct', TokenType.structKeyword),
  Token(-1, 'with', TokenType.withKeyword),
  Token(-1, 'has', TokenType.hasKeyword),
  Token(-1, 'data', TokenType.dataKeyword),
  Token(-1, 'try', TokenType.tryKeyword),
  Token(-1, 'on', TokenType.onKeyword),
  Token(-1, 'get', TokenType.getKeyword),
  Token(-1, 'catch', TokenType.catchKeyword),
  Token(-1, 'throw', TokenType.throwKeyword),
  Token(-1, 'break', TokenType.breakKeyword),
  Token(-1, 'continue', TokenType.continueKeyword),

  // Separators
  Token(-1, '.', TokenType.dot),
  Token(-1, ',', TokenType.comma),
  Token(-1, ':', TokenType.colon),
  Token(-1, '(', TokenType.openParenthesis),
  Token(-1, ')', TokenType.closeParenthesis),
  Token(-1, '[', TokenType.openSquareBracket),
  Token(-1, ']', TokenType.closeSquareBracket),

  // Arithmatic operators
  Token(-1, '+', TokenType.opAdd),
  Token(-1, '-', TokenType.opSubtract),
  Token(-1, '*', TokenType.opMultiply),
  Token(-1, '/', TokenType.opDivide),
  Token(-1, '%', TokenType.opModulus),
  Token(-1, '++', TokenType.opIncrement),
  Token(-1, '--', TokenType.opDecrement),

  // Logical operators
  Token(-1, '&&', TokenType.opAnd),
  Token(-1, '||', TokenType.opOr),
  Token(-1, '!', TokenType.opNot),

  // Relational operators
  Token(-1, '==', TokenType.opEqualTo),
  Token(-1, '!=', TokenType.opNotEqualTo),
  Token(-1, '<', TokenType.opLessThan),
  Token(-1, '>', TokenType.opGreaterThan),
  Token(-1, '<=', TokenType.opLessThanOrEqualTo),
  Token(-1, '>=', TokenType.opGreaterThanOrEqualTo),

  // Assignment operators
  Token(-1, '=', TokenType.opAssign),
  Token(-1, '+=', TokenType.opAddAssign),
  Token(-1, '-=', TokenType.opSubtractAssign),
  Token(-1, '*=', TokenType.opMultiplyAssign),
  Token(-1, '/=', TokenType.opDivideAssign),
  Token(-1, '%=', TokenType.opModulusAssign),

  // Literals
  Token(-1, '"myString"', TokenType.stringLiteral),
  Token(-1, '"""myString\n\ncontinues till here"""', TokenType.stringLiteral),
  Token(-1, '45', TokenType.numberLiteral),
  Token(-1, '0.78', TokenType.numberLiteral),
  Token(-1, '.78', TokenType.numberLiteral),
  Token(-1, '0x78', TokenType.numberLiteral),

  // Comments
  Token(-1, '// This is a line comment', TokenType.lineComment),
  Token(
      -1,
      '/// This is a block comment\n/// And it continues till here\n/// and here',
      TokenType.blockComment),
];

void main() {
  group('Lexer Test', () {
    group('tokenise(source)', () {
      Lexer? instance;
      setUp(() {
        instance = Lexer();
      });

      test('Should return an empty list when given an empty source', () {
        expect(instance!.tonekise(''), isEmpty);
      });

      test('Should capture the correct starting indices for tokens', () {
        final source = ' 56>=\n"myString"';
        final expectedTokens = [
          Token(1, '56', TokenType.numberLiteral),
          Token(3, '>=', TokenType.opGreaterThanOrEqualTo),
          Token(6, '"myString"', TokenType.stringLiteral),
        ];

        expect(instance!.tonekise(source), expectedTokens);
      });

      test('Should recognise all tokens', () {
        final tokens = instance!.tonekise(allLexemes);

        expect(tokens, hasLength(expectedTokensIgnoringStartingIndices.length));
        for (var i = 0; i < expectedTokensIgnoringStartingIndices.length; i++) {
          final returnedToken = tokens[i];
          final expectedToken = expectedTokensIgnoringStartingIndices[i];

          expect(returnedToken.data, equals(expectedToken.data));
          expect(returnedToken.type, equals(expectedToken.type));
        }
      });
    });
  });
}
