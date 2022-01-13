// A simple program to demostrate functions in night script
//
// The nightScript team

// For functions whose return type is not explicitly stated:
// 1. If the function returns a value, the function return type is the type of that value
// 2. If the function returns different types, the closest base type of the different types is the
//    function return value. any is the base type of all variables.
// 3. If the function returns nothing, then void is its return type.

// A function definition
function timesTwo(x: num): num {
  return x * 2;
}

// Return type will be infered as num
function timesFour(x: num) => timesTwo(timesTwo(x));

// Functions can be passed to other functions
// We could also have used a typedef for f:
// typedef F = (num) => num
//  
function runTwice(x: num, f: (num) => num): num {
  for i = 0, i < 2, i++ {
    x = f(x);
  }
  
  return x;
}

function funcWithDefaultValue(x = 0) => x;
function anotherFuncWithDefaultValue(x: num = 0, y = 4) => x*y;

function main() {
  print("4 times two is ${timesTwo(4)}");
  print("4 times four is ${timesFour(4)}");
  print("2 x 2 x 2 is ${runTwice(2, timesTwo)}");
}
