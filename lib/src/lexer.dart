part of night_script;

abstract class Tokeniser {
  /// Tokenises the given source.
  ///
  /// A lexeme that cannot be matched to any token will be treated as an unknown
  /// token and will be logged in [unknownSymbols].
  List<Token> tokenise(String source);

  /// A list of all the symbols not matched to a recognised token.
  List<Token> get unknownSymbols;

  factory Tokeniser() = _Tokeniser;
}

class _Tokeniser implements Tokeniser {
  @override
  List<Token> unknownSymbols = [];

  @override
  List<Token> tokenise(String source) {
    var stringTypeWeCurrentlyIn = _CurrentStringType.NONE;
    var commentTypeWeCurrentlyIn = _CurrentCommentType.NONE;
    var stagedCharacters = StringBuffer();
    final out = <Token>[];

    int startIndexOfNextToken() {
      if (out.isEmpty) return 0;
      return out.last.endIndex;
    }

    void terminateStagedCharactersAsStringLiteral() {
      stringTypeWeCurrentlyIn = _CurrentStringType.NONE;
      out.add(
        Token(startIndexOfNextToken(), stagedCharacters.toString(),
            TokenType.stringLiteral),
      );

      stagedCharacters.clear();
    }

    void tokeniseStagedCharactersAndClearThem(List<Token> out) {
      out.addAll(tokeniseRecursively(
          startIndexOfNextToken(), stagedCharacters.toString()));
      stagedCharacters.clear();
    }

    void removeLastStagedCharacter() {
      final write =
          stagedCharacters.toString().substring(0, stagedCharacters.length - 1);
      stagedCharacters.clear();
      stagedCharacters.write(write);
    }

    for (var iii = 0; iii < source.length; iii++) {
      final char = source[iii];
      stagedCharacters.write(char);

      // Check for string and comment termination
      if (stringTypeWeCurrentlyIn == _CurrentStringType.SINGLE_LINE) {
        if (char == '\n') {
          stringTypeWeCurrentlyIn = _CurrentStringType.NONE;
        } else if (char == '"') {
          // String is being terminated
          terminateStagedCharactersAsStringLiteral();
        }
      } else if (stringTypeWeCurrentlyIn == _CurrentStringType.MULTILINE) {
        if (char == '"' &&
            source.hasNextTwoCharsAfterIndex(iii) &&
            source.nextTwoCharsAfterIndexEqual('""', iii)) {
          // Multiline string is being terminated
          stagedCharacters.write(source.nextTwoCharsAfterIndex(iii));
          iii += 2; // Skip the next two characters
          terminateStagedCharactersAsStringLiteral();
        }
      } else if (commentTypeWeCurrentlyIn != _CurrentCommentType.NONE) {
        if (char == '\n' || source.weHaveReachedLastCharacterInSource(iii)) {
          if (char == '\n') removeLastStagedCharacter();

          // Comment is being terminated
          out.add(
            Token(
              startIndexOfNextToken(),
              stagedCharacters.toString(),
              commentTypeWeCurrentlyIn ==
                      _CurrentCommentType.SINGLE_LINE_COMMENT
                  ? TokenType.lineComment
                  : TokenType.docComment,
            ),
          );
          commentTypeWeCurrentlyIn = _CurrentCommentType.NONE;
          stagedCharacters.clear();

          if (char == '\n') stagedCharacters.write('\n');
        }
      }

      // Check for string and comment beginning
      else if (char == '"') {
        if (source.hasNextTwoCharsAfterIndex(iii) &&
            source.nextTwoCharsAfterIndexEqual('""', iii)) {
          // Beginning of multiline string
          removeLastStagedCharacter();
          tokeniseStagedCharactersAndClearThem(out);
          stagedCharacters.write(char);
          stringTypeWeCurrentlyIn = _CurrentStringType.MULTILINE;
        } else {
          // Beginning of single line string
          removeLastStagedCharacter();
          tokeniseStagedCharactersAndClearThem(out);
          stagedCharacters.write(char);
          stringTypeWeCurrentlyIn = _CurrentStringType.SINGLE_LINE;
        }
      } else if (char == '/') {
        if (source.hasNextTwoCharsAfterIndex(iii) &&
            source.nextTwoCharsAfterIndexEqual('//', iii)) {
          // Beginning of doc comment
          removeLastStagedCharacter();
          tokeniseStagedCharactersAndClearThem(out);
          commentTypeWeCurrentlyIn = _CurrentCommentType.MULTILINE_COMMENT;
          stagedCharacters.write(char + source.nextTwoCharsAfterIndex(iii));
          iii += 2; // Skip the next two characters
        } else if (source.hasNextCharAfterIndex(iii) &&
            source.nextCharAfterIndexEquals('/', iii)) {
          // Beginning of line comment
          removeLastStagedCharacter();
          tokeniseStagedCharactersAndClearThem(out);
          commentTypeWeCurrentlyIn = _CurrentCommentType.SINGLE_LINE_COMMENT;
          stagedCharacters.write(char + source.nextCharAfterIndex(iii));
          iii += 1; // Skip next character
        }
      }
    }

    tokeniseStagedCharactersAndClearThem(out);
    return out;
  }

  List<Token> tokeniseRecursively(int startIndexOffset, String leg) {
    Token? foundToken;
    var foundTokenStartIndexInLeg = -1;
    var foundTokenEndIndexInLeg = -1;
    for (var lexemeMatcher in _lexemeMatchers.entries) {
      final matcher = lexemeMatcher.key;
      var tokenType = lexemeMatcher.value;

      final foundLexeme = matcher.firstMatch(leg);
      if (foundLexeme != null) {
        foundTokenStartIndexInLeg = foundLexeme.start;
        foundTokenEndIndexInLeg = foundLexeme.end;
        final tokenData =
            leg.substring(foundTokenStartIndexInLeg, foundTokenEndIndexInLeg);

        // Keywords will be matched as identifiers because we have not found a way
        // to match them separately. So we need to just check every
        // identifier token and if it's a keyword, we mark it as a keyword.
        // TODO(Batandwa): Keywords should have their own matchers rather than leaning on identifiers
        if (tokenType == TokenType.identifier) {
          final retype = _keywordTokens[tokenData];
          if (retype != null) tokenType = retype;
        }

        foundToken = Token(
          foundTokenStartIndexInLeg + startIndexOffset,
          tokenData,
          tokenType,
        );

        break;
      }
    }

    if (foundToken == null) {
      // The leg is not empty but no lexeme matcher matches. So we match
      // the symbols character by character, which should be faster than using
      // regexp.
      return tokeniseOneAndTwoCharacterLexemes(
          startIndexOffset, leg, unknownSymbols);
    }

    final leftLeg = leg.substring(0, foundTokenStartIndexInLeg);
    final rightLeg = leg.substring(foundTokenEndIndexInLeg);

    return [
      ...tokeniseRecursively(startIndexOffset, leftLeg),
      foundToken,
      ...tokeniseRecursively(foundToken.endIndex, rightLeg)
    ];
  }

  List<Token> tokeniseOneAndTwoCharacterLexemes(
      int startIndexOffset, String leg, List<Token> unknownSymbolsOut) {
    final out = <Token>[];
    for (var iii = 0; iii < leg.length; iii++) {
      final char = leg[iii];
      if (char == ' ') continue;

      var matchStartIndex = -1;
      MapEntry<String, TokenType>? match;

      if (leg.hasNextCharAfterIndex(iii)) {
        final nextChar = leg.nextCharAfterIndex(iii);
        if (nextChar != ' ') {
          final test = char + nextChar;
          for (var twoCharacterToken in _twoCharacterTokens.entries) {
            if (twoCharacterToken.key == test) {
              match = twoCharacterToken;
              matchStartIndex = iii + startIndexOffset;
              iii += 1;
              break;
            }
          }
        }
      }

      if (match == null) {
        // Check one character tokens
        for (var oneCharacterToken in _oneCharacterTokens.entries) {
          if (oneCharacterToken.key == char) {
            matchStartIndex = iii + startIndexOffset;
            match = oneCharacterToken;
            break;
          }
        }
      }

      if (match == null) {
        unknownSymbolsOut
            .add(Token(startIndexOffset + iii, char, TokenType.unknown));
      } else {
        out.add(Token(matchStartIndex, match.key, match.value));
      }
    }

    return out;
  }
}

enum _CurrentStringType {
  SINGLE_LINE,
  MULTILINE,
  NONE,
}

enum _CurrentCommentType {
  SINGLE_LINE_COMMENT,
  MULTILINE_COMMENT,
  NONE,
}

extension _SourceStringExtension on String {
  String nextTwoCharsAfterIndex(int index) {
    return this[index + 1] + this[index + 2];
  }

  bool nextTwoCharsAfterIndexEqual(String equal, int index) {
    return this[index + 1] == equal[0] && this[index + 2] == equal[1];
  }

  bool hasNextTwoCharsAfterIndex(int index) {
    return index + 2 < length;
  }

  String nextCharAfterIndex(int index) {
    return this[index + 1];
  }

  bool nextCharAfterIndexEquals(String equal, int index) {
    return this[index + 1] == equal;
  }

  bool hasNextCharAfterIndex(int index) {
    return index + 1 < length;
  }

  bool weHaveReachedLastCharacterInSource(int index) {
    return index == length - 1;
  }
}
