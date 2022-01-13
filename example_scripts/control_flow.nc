// A simple program to demonstrate control flow in nightScript
//
// The nightScript authors

function isEven(x: num): bool {
  // An if-else statement 
  if x % 2 == 0 {
    return true;
  } else {
    return false;
  }
}


function evenNumbersIn(numbers: list<num>): list<num> {
  let evenNumbers = <num>[];

  // A forEach loop
  for i in numbers {
    if isEven(i) {
      evenNumbers.add(i);
    };
  }

  return evenNumbers;
}


// Main
function main() {
  // Note that i => i is a lambda function that maps i to itself.
  let numbers = List.generate(10, (i) => i);
  print(evenNumbersIn(numbers));

  final x = numbers.length == 10 ? 5 : 20;
  final a = numbers.length > 5;
}