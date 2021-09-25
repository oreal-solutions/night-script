import 'dart:io';

import 'package:night_script/night_script.dart' as night_script;

void main(List<String> args) {
  final lexer = night_script.Lexer();
  final source = File(args.first).readAsStringSync();
  print(lexer.tokenise(source));
}
