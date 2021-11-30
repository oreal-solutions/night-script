// Another simple program to demosntrate the use of structs in nightScript
//
// the nightScript team

struct Point {
  x: num,
  y: num,
}

func Point.isInsideUnitCircle(): boolean {
  return x * x + y * y <= 1
}

func zeroPoint() => Point {
  x: 0,
  y: 0
}

func quadPoint(w: num): Point {
  return Point {
    x: w,
    y: w
  }
}
