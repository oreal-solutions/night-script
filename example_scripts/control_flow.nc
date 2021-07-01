// A simple program to demonstrate control flow in nightScript
//
// The nightScript authors

include "nc:collections"

def isEven takes x
  // An if-else statement 
  if x % 2 == 0
    return true
  else
    // else can be use an endIf
    return false
endDef

def getEvenNumbersFrom numbers
  let evenNumbers = emptyList

  // A forEach loop
  forEach i in numbers
    // A single line if statement
    if isEven i
      evenNumbers.add i
    endIf
  endForEach

  return evenNumbers
endDef

// Main
// Note that i => i is a lambda function that maps i to itself.
let numbers = ArrayList.generate 10, i => i
print getEvenNumbersFrom numbers

// Some languages have the ? operator, night script uses if else for that
let x = 5 if numbers.length == 10 else 20
let a = true if numbers.length > 5