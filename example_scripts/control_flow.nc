// A simple program to demonstrate control flow in nightScript
//
// The nightScript authors

include "nc:collections"

func isEven(x: num): bool {
  // An if-else statement 
  if x % 2 == 0 {
    return true
  } else {
    // else can be use an endIf
    return false
  }
}


func evenNumbersIn(numbers: Iterable<num>): Iterable<num> {
  let evenNumbers = List.empty()

  // A forEach loop
  for i in numbers {
    // A single line if statement
    if isEven(i) -> evenNumbers.add(i)
  }

  return evenNumbers
}


// Main
func main() {
  // Note that i => i is a lambda function that maps i to itself.
  let numbers = List.generate(10, (i) => i)
  print(evenNumbersIn(numbers))

  final x = numbers.length == 10 ? 5:20
  final a = numbers.length > 5
}