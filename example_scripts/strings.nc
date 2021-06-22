include "nc:math" as math

print "a double quoted string"

// Strings can be combined with the + operator.
print "cat" + "dog"

// Triple quotes define multi-line string.
print """triple quoted strings
are for multiple lines"""

// nightScript supports string interpolation
let pi = math.pi
print "pi is $pi"
print "tau is ${2 * pi}"
