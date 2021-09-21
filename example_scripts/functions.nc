// A simple program to demostrate functions in night script
//
// The nightScript team

// def <functionName> <parameters> -> <statement>
// 
// <statement> has a type, which, if ommited is the common base type of the
// values that can be returned from the statement. If the returned values
// have no common base type, then 'any' is the type of the statement.
// It is an error for some paths to return a value and some not.
// def <functionName> <parameters> -> <return-type> {}
// 
// <return-type> can be 'void' if the return type can be ignored
// def <functionName> <parameters> -> void {}
// 
// If the {} block only has one statement them the braces can be dropped.
// def <functionName> <parameters> -> statement
//
// If the <return-type> does not need to be explicitly stated and the definition
// takes no arguments, the -> can be omitted.
// e.g def main {}

// A function definition
def timesTwo x: num -> num {
  // -> is equivalent to 'return' in most languages. 
  // It means the block evaluates to the statement on the right of it.
  -> x * 2
}

def timesFour x: num -> timesTwo(timesTwo x)

// Functions can be passed to other functions
def runTwice takes x: num and f: (num -> num) -> num {
  for i = 0, i < 2, i++ {
    x = f(x)
  }
  
  -> x
}

def main {
  print "4 times two is ${timesTwo 4}"
  print "4 times four is ${timesFour 4}"
  print "2 x 2 x 2 is ${runTwice 2, function timesTwo}"
}
