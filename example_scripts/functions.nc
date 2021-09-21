// A simple program to demostrate functions in night script
//
// The nightScript team

// def <functionName> <parameters> <statement>
// 
// block can have a return type, but if does not, void is the return type:
// def <functionName> <parameters> -> <return-type> {}
// 
// <return-type> can be omitted in which case the any type will be the type.
// It is an error for some paths to return a value and some not.
// This is useful in assign-when blocks.
// def <functionName> <parameters> -> {}
// 
// If the {} block only has one statement them the parenthesis can be dropped.
// def <functionName> <parameters> -> statement
//
// If the return type does not need to be explicitly stated, the -> can be
// omitted.
// e.g def main {}

// A function definition
def timesTwo x: num -> num {
  // -> -s equivalent to 'return' in most languages. 
  // It means the block evaluates to the statement on the right of it.
  -> x * 2
}


def timesFour x: num => timesTwo(timesTwo x)

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
