import 'dart:io';

import 'package:night_script/night_script.dart';

void main(List<String> args) {
  final tokeniser = Tokeniser();
  final source = File(args.first).readAsStringSync();
  final tokens = tokeniser.tokenise(source);
  if (logUnknownSymbols(tokens, args.first)) {
    exit(-1);
  }

  for (final token in tokens) {
    stdout.write(token.data);
  }
}

/// Logs all unknown symbols in the given list.
///
/// Returns true if unknown symbols were found, false otherwise.
bool logUnknownSymbols(List<Token> allTokens, String filename) {
  final unknownTokens =
      allTokens.where((token) => token.type == TokenType.unknown);
  if (unknownTokens.isNotEmpty) {
    print('Unknown symbols in file $filename:');
    for (final token in unknownTokens) {
      print('Unknown symbol ${token.data} in line ${token.lineNumber}');
    }

    return true;
  }

  return false;
}
