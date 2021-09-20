import 'package:night_script/night_script.dart' as night_script;

void main(List<String> arguments) {
  final test = '"""hello 3""" """hello 4"""';
  final match = RegExp(r'""".*"""').firstMatch(test);
  print(test.substring(match!.start, match.end));
}
