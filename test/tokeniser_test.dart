import 'package:night_script/night_script.dart';
import 'package:test/test.dart';

void main() {
  group('Tokeniser Test', () {
    group('tokenise(source)', () {
      late Tokeniser instance;
      setUp(() {
        instance = Tokeniser();
      });

      test('Should return an empty list when given an empty source', () {
        expect(instance.tokenise(''), isEmpty);
      });

      test('Should capture the correct starting indices for tokens', () {
        final source = ' 56>=\n"myString"\ntype\nany\n';
        final expectedTokens = [
          Token(1, '56', TokenType.integerLiteral),
          Token(3, '>=', TokenType.opGreaterThanOrEqualTo),
          Token(5, '\n', TokenType.newline),
          Token(6, '"myString"', TokenType.stringLiteral),
          Token(16, '\n', TokenType.newline),
          Token(17, 'type', TokenType.typeKeyword),
          Token(21, '\n', TokenType.newline),
          Token(22, 'any', TokenType.anyKeyword),
          Token(25, '\n', TokenType.newline),
        ];

        expect(instance.tokenise(source), expectedTokens);
      });

      test('Should tokenise keywords and symbols literally', () {
        final source = 'func ==';
        final expectedTokens = [
          Token(0, 'func', TokenType.funcKeyword),
          Token(5, '==', TokenType.opEqualTo),
        ];

        expect(instance.tokenise(source), expectedTokens);
      });

      test('Should not capture keywords that are part of a word', () {
        final source = 'oh_import_here';
        final expectedTokens = [
          Token(0, 'oh_import_here', TokenType.identifier),
        ];

        expect(instance.tokenise(source), expectedTokens);
      });

      test('Should recognise single line strings with comments', () {
        final source =
            '"This is a string, // with a comment here and /// another comment here"';
        final expectedTokens = [
          Token(0, source, TokenType.stringLiteral),
        ];

        expect(instance.tokenise(source), expectedTokens);
      });

      test(
          'Should recognise a not closed single line string as a parsable substring',
          () {
        final source = '"abc\n';
        final unknownSymbols = [
          Token(0, '"', TokenType.unknown),
        ];

        final expectedTokens = [
          Token(1, 'abc', TokenType.identifier),
          Token(4, '\n', TokenType.newline),
        ];

        final returnedTokens = instance.tokenise(source);
        expect(instance.unknownSymbols, unknownSymbols);
        expect(returnedTokens, expectedTokens);
      });

      test('Should recognise multiline strings with comments', () {
        final source =
            '"""This is a string, \n // with a comment here and \n /// another comment here"""';
        final expectedTokens = [
          Token(0, source, TokenType.stringLiteral),
        ];

        expect(instance.tokenise(source), expectedTokens);
      });

      test('Should recognise single line comment with strings', () {
        final source =
            '// This is a comment "with string here" and """another string here"""';
        final expectedTokens = [
          Token(0, source, TokenType.lineComment),
        ];

        expect(instance.tokenise(source), expectedTokens);
      });

      test('Should terminate comments by newline and EOF', () {
        final source = '//abc\n//func';
        final expectedTokens = [
          Token(0, '//abc', TokenType.lineComment),
          Token(5, '\n', TokenType.newline),
          Token(6, '//func', TokenType.lineComment),
        ];

        expect(instance.tokenise(source), expectedTokens);
      });

      test('Should recognise doc comment with strings', () {
        final source =
            '/// This is a comment "with string here" and """another string here"""';
        final expectedTokens = [
          Token(0, source, TokenType.docComment),
        ];

        expect(instance.tokenise(source), expectedTokens);
      });

      test('Should identify decimals as numbers', () {
        final source = '0.5';
        final expectedTokens = [
          Token(0, '0.5', TokenType.numberLiteral),
        ];

        expect(instance.tokenise(source), expectedTokens);
      });

      test('Should identify decimals with E as numbers', () {
        final source = '0.5E3';
        final expectedTokens = [
          Token(0, '0.5E3', TokenType.numberLiteral),
        ];

        expect(instance.tokenise(source), expectedTokens);
      });

      test('Should identify positive integers', () {
        final source = '967';
        final expectedTokens = [
          Token(0, '967', TokenType.integerLiteral),
        ];

        expect(instance.tokenise(source), expectedTokens);
      });

      test('Should identify positive hexadecimal integers', () {
        final source = '0xFF';
        final expectedTokens = [
          Token(0, '0xFF', TokenType.integerLiteral),
        ];

        expect(instance.tokenise(source), expectedTokens);
      });

      test(
          'Should recognise Vector3 as a single identifier and not Vector and 3',
          () {
        final source = 'Vector3';
        final expectedTokens = [
          Token(0, 'Vector3', TokenType.identifier),
        ];

        expect(instance.tokenise(source), expectedTokens);
      });
    });
  });
}
