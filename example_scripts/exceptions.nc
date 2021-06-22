// A program to demostrate the use of exeptions in night script.
//
// The nightScript team

// Watch the use of the command and 'and'.

try
  throwString
on string get thrownString and stacktrace
  print "We got a string: '$thrownString'"
  print "We also got a stacktrace\n$stacktrace"
catch anythingElse
  print "Something other than a string was thrown: $anythingElse"

try throwNumber
on number get thrownNumber, stacktrace
  // do nothing
catch anythingElse and stacktrace
  // still do nothing



def throwString
  throw "Throw What?"
endDef

def throwNumber
  throw 42
endDef
