// A simple program to demonstrate control flow in nightScript
//
// The nightScript authors

include "nc:collections"

def isEven takes x: num -> boolean {
  // An if-else statement 
  if x % 2 == 0
    -> true
  else
    // else can be use an endIf
    -> false
}


def evenNumbersIn numbers: Iterable<num> -> Iterable<num> {
  let evenNumbers = newEmptyList

  // A forEach loop
  for i in numbers {
    // A single line if statement
    if isEven i -> evenNumbers.add i
  }

  -> evenNumbers
}


// Main
def main {
  // Note that i -> i is a lambda function that maps i to itself.
  let numbers = ArrayList.generate 10, i -> i
  print evenNumbersIn numbers

  // Some languages have the ? operator, night script uses if else for that
  let x = 5 if numbers.length == 10 else 20
  let a = true if numbers.length > 5
}