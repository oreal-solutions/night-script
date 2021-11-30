/// A simple program that further demostrates structs in nightScript
/// 
/// The nightScript Team.

struct Rectangle {
  width: num,
  height: num,
}

getter Rectangle.area => width*height

func main() {
  // Inititalise a new Rectangle object
  final r = Rectangle {
    width: 20,
    height: 10
  }

  // Return value is 20*10 = 200
  return r.area
}