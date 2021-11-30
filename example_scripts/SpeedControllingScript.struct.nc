// A simple script to demonstrate struct source files in nightScript
//
// The nightScript authors

// All variables can be initialised when the struct is created
// Only thoase that are final and initialised cannot be set.
// 
// import "SpeedControllingScript.struct.nc"
//
// let s = SpeedControllingScript {
//    color: Colors.blue,      // Correct
//    speed: 0.5               // Correct
//    
//    SPEED_FACTOR: 0.4        // Error
// }
//
// .struct.nc files cannot have struct and enum definitions. i.e structs
// cannot be nested.

final SPEED_FACTOR = 0.3

final color: Color
let speed = 0

func onDraw(delta: num) {
  speed *= SPEED_FACTOR * delta
}

func onKeyboard(key: KeyEvent) {
  if key is SpaceKeyDownEvent {
    this.gameObject.removeFromGameWorld()
  }
}