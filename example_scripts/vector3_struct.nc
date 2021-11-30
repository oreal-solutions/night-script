// A 3D vector struct in nightScript
//
// Rewritten in nightScript from https://www.javatips.net/api/WorldEditCUI-master/src/main/java/wecui/util/Vector3.java
//
// The nightScript team

// NB: 'takes' is optional in function funcinitions.
//     The funcault toString method for structs prints the values of the struct
//     fields using their toString methods.

include "nc:math" as math

struct Vector3 {
  x: num,
  y: num,
  z: num,
}

/// Vector with all elements set to zero.
final ZERO = Vector3 {
  x: 0,
  y: 0,
  z: 0
}

/// Unit vector in the X direction. (1, 0, 0)
final UNIT_X = Vector3 {
  x: 1,
  y: 0,
  z: 0
}

/// Unit vector facing forward. (1, 0, 0)
final FORWARD = UNIT_X

/// Unit vector in the Y direction. (0, 1, 0)
final UNIT_Y = Vector3 {
  x: 0,
  y: 1,
  z: 0
}

/// Unit vector pointing up. (0, 1, 0)
final UP = UNIT_Y

/// Unit vector in the z direction. (0, 0, 1)
final UNIT_Z = Vector3 {
  x: 0,
  y: 0,
  z: 1
}

/// Unit vector pointing right. (0, 0, 1)
final RIGHT = UNIT_Z

// Unit vector will all elements set to 1.
final ONE = Vector3 {
  x: 1,
  y: 1,
  z: 1
}

/// Constructs a new Vector3 that is a clone of the given Vector3.
func Vector3.copy() => Vector3 {
  x: x,
  y: y,
  z: y
}

func Vector3.operator+(other: Vector3) => Vector3 {
  x: x+other.x,
  y: y+other.y,
  z: z+other.z,
}

func Vector3.operator-(other: Vector3) => Vector3 {
  x: x-other.x,
  y: y-other.y,
  z: z-other.z,
}

func Vector3.operator*(factor: any) {
  if factor is num {
    return Vector3 {
      x: x*factor,
      y: y*factor,
      z: z*factor,
    }
  } else if factor is Vector3 {
    return factor.dot(this)
  } else {
    throw Error("Cannot multiply with type of ${typeof factor}")
  }
}

func Vector3.operator==(other: any) => x is Vector3 && x == other.x && y == other.y && z = other.z

func Vector3.dot(other: Vector3): num {
  throw "Unimplemented method"
}

func Vector3.cross(other: Vector3): Vector3 {
  throw "Unimplemented method"
}

func Vector3.ceil() => Vector3 {
  x: math.ceil(x),
  y: math.ceil(y),
  z: math.ceil(z),
}

func Vector3.floor() => Vector3 {
  x: math.floor(x),
  y: math.floor(y),
  z: math.floor(z),
}

func Vector3.round() => Vector3 {
  x: math.round(x),
  y: math.round(y),
  z: math.round(z),
}

func Vector3.abs() => Vector3 {
  x: math.abs(x),
  y: math.abs(y),
  z: math.abs(z),
}

func Vector3.toThePowerOf(power: num) => Vector3 {
  x: math.pow(x, power),
  y: math.pow(y, power),
  z: math.pow(z, power),
}

func Vector3.distanceFrom(other: Vector3) {
  throw "Unimplemented method"
}

getter Vector3.lengthSquared => this.dot(this)

getter Vector3.length => sqrt(lengthSquared)

getter Vector3.fastLength => sqrt(lengthSquared)

getter Vector3.normalised => this * 1/length

func Vector3.toArray() => [x, y, z]

