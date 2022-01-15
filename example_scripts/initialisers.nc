// A simple program to demonstrate async await in nightScript
//
// The nightScript authors

struct Boolean {
  value: bool;
}

// An initialiser. A data type can only have one initialiser.
function Boolean.(value: string) {
  this.value = value.toLowerCase() == "true";
}

override function Boolean.toString(): string {
  return this.value.toString();
}

function main() {
  let boolean = Boolean("true");

  // true
  print(boolean)

  boolean = Boolean("false");
  // false
  print(boolean);
}