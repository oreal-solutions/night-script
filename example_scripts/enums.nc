// A program to demostrate the use of enums in night script.
//
// The nightScript team

enum Mode {
  LIGHT,
  DARK,
}

def main {
  // [Mode.LIGHT, Mode.DARK]
  print Mode.values

  def Mode.toInt -> Mode.values.indexOf this

  // 0 1
  print Mode.LIGHT.toInt + " " + Mode.DARK.toInt
}