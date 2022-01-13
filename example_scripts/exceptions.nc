// A program to demostrate the use of exeptions in night script.
//
// The nightScript team


function throwString(): void {
  throw "Throw What?";
}

function throwNumber(): void {
  throw 42;
}

function main(): void {
  try {
    throwString(); 
  } on string catch(thrownString, stacktrace) {
    print("We got a string: '$thrownString'");
    print("We also got a stacktrace\n$stacktrace");
  } catch(anythingElse) {
    print("Something other than a string was thrown: $anythingElse");
  }

  try {
    throwNumber();
  } on number catch(thrownNumber, stacktrace) {}
  catch (anythingElse, stacktrace) {}

}
