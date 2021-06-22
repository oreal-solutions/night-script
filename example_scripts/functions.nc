// A simple program to demostrate functions in night script
//
// The nightScript team

// A function declaration
def timesTwo takes x
  return x * 2
endDef

def timesFour takes x
  return timesTwo(timesTwo x)
endDef

// Functions can be passed to other functions
def runTwice takes x, f
  for i = 0, i < 2, i = i+1
    x = f(x)
  endFor
  return x
endDef

// Main
print "4 times two is ${timesTwo 4}"
print "4 times four is ${timesFour 4}"
print "2 x 2 x 2 is ${runTwice 2, function timesTwo}"
