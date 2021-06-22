// Another simple program to demosntrate the use of structs in nightScript
//
// the nightScript team

struct Point has x, y

def Point.isInsideUnitCircle
  return x * x + y * y <= 1
endDef

def zeroPoint
  return Point {x: 0, y: 0}
endDef

def quadPoint takes w
  return Point {x: w, y: w}
endDef
