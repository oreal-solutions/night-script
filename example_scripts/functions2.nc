/// A simple program to demostrate functions in other functions in night script.
/// 
/// The nightScript Team

// In nightScript functions can be created in any scope.

include "nc:math"
include "nc:collections"

def sumOfDoubleSqrtsOf numbers -> {
  def doubleSqrtOf x: num -> {
    -> 2 * sqrt x
  }

  final out = newEmptyList
  for x in numbers {
    out.add doubleSqrtOf x
  }

  -> out.reduce 0, (accum, next -> accum += next)
}

def main {
  final numbers = [4, 16, 25]
  print "The sum of the doubles of the square roots of $numbers is ${sumOfDoubleSqrtsOf numbers}"
}