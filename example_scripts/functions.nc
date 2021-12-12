// A simple program to demostrate functions in night script
//
// The nightScript team

// Functions whose return type is not explicitly stated return any by default.

// A function definition
func timesTwo(x: num): num {
  return x * 2
}

// Return type will be infered as num
func timesFour(x: num) => timesTwo(timesTwo(x))

// Functions can be passed to other functions
func runTwice(x: num, f: (num)-> num): num {
  for i = 0, i < 2, i++ {
    x = f(x)
  }
  
  return x
}

func funcWithDefaultValue(x = 0) => x
func anotherFuncWithDefaultValue(x: num = 0, y = 4) => x*y

func main() {
  print("4 times two is ${timesTwo 4}")
  print("4 times four is ${timesFour 4}")
  print("2 x 2 x 2 is ${runTwice 2, function timesTwo}")
}
