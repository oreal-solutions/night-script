// Another simple program to demosntrate the use of structs in nightScript
//
// the nightScript team

struct Point {
  x: num,
  y: num,
}

def Point.isInsideUnitCircle {
  -> x * x + y * y <= 1
}

def zeroPoint {
  -> Point {x: 0, y: 0}
}

def quadPoint takes w: num -> {
  -> Point {x: w, y: w}
}
