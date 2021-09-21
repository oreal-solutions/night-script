/// A simple program that further demostrates structs in nightScript
/// 
/// The nightScript Team.

struct Rectangle {
  width: num,
  height: num,
}

def Rectangle.area -> width*height

def main {
  // Inititalise a new Rectangle object
  let r = Rectangle {
    width: 20,
    height: 10
  }

  // Return value is 20*10 = 200
  -> r.area
}