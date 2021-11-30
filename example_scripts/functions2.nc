/// A simple program to demostrate functions in other functions in night script.
/// 
/// The nightScript Team

// In nightScript functions can be created in any scope.

include "nc:math"
include "nc:collections"

func sumOfDoubleSqrtsOf(numbers) {
  func doubleSqrtOf(x: num) {
    return 2 * sqrt(x)
  }

  final out = List.empty()
  for x in numbers {
    out.add(doubleSqrtOf(x))
  }

  return out.reduce(0, (accum, next) => accum += next)
}

func main() {
  final numbers = [4, 16, 25]
  print("The sum of the doubles of the square roots of $numbers is ${sumOfDoubleSqrtsOf(numbers)}")
}