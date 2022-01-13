// A simple script to demonstrate struct source files in nightScript
//
// The nightScript authors

// All variables can be initialised when the struct is created
// Only those that are final and initialised cannot be set.
// 
// import "SpeedControllingScript.struct.nc"
//
// let s = SpeedControllingScript {
//    color: Colors.blue,      // Correct
//    speed: 0.5,              // Correct
//    
//    SPEED_FACTOR: 0.4,       // Error
// }
//
// .struct.nc files cannot have struct and enum definitions. i.e structs
// cannot be nested.

import "linyard:events" as events;
import "linyard:dynamics";

with GameObjectScript;

final SPEED_FACTOR = 0.3;

final color: Color;
let speed = 0;

// Override is not required but makes the cdeo more readable and
// also tells the compiler to throw an error if this method does not exist
override function onDraw(delta: num) {
  speed *= SPEED_FACTOR * delta;
}

override function onKeyboard(key: events.KeyEvent) {
  if key is events.SpaceKeyDownEvent {
    this.gameObject.removeFromGameWorld();
  }
}