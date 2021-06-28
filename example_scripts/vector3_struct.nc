// A 3D vector struct in nightScript
//
// Rewritten in nightScript from https://www.javatips.net/api/WorldEditCUI-master/src/main/java/wecui/util/Vector3.java
//
// The nightScript team

// NB: 'and' can be used instead of the command in struct definitions
//     'takes' is optional in function definitions.
//     The default toString method for structs prints the values of the struct
//     fields using their toString methods.

include "nc:math"

struct Vector3 has x, y and z

/// Vector with all elements set to zero.
final ZERO = Vector3 {x: 0, y: 0, z: 0}

/// Unit vector in the X direction. (1, 0, 0)
final UNIT_X = Vector3 {x: 1, y: 0, z: 0}

/// Unit vector facing forward. (1, 0, 0)
final FORWARD = UNIT_X

/// Unit vector in the Y direction. (0, 1, 0)
final UNIT_Y = Vector3 {x: 0, y: 1, z: 0}

/// Unit vector pointing up. (0, 1, 0)
final UP = UNIT_Y

/// Unit vector in the z direction. (0, 0, 1)
final UNIT_Z = Vector3 {x: 0, y: 0, z: 1}

/// Unit vector pointing right. (0, 0, 1)
final RIGHT = UNIT_Z

// Unit vector will all elements set to 1.
final ONE = Vector3 {x: 1, y: 1, z: 1}

/// Constructs a new Vector3 that is a clone of the given Vector3.
def Vector3.copy
  return Vector3 {x: x, y: y, z: y}
endDef

def Vector3.operator+ takes other
  return Vector3 {
    x: x+other.x,
    y: y+other.y,
    z: z+other.z,
  }
endDef

def Vector3.operator- takes other
  return Vector3 {
    x: x-other.x,
    y: y-other.y,
    z: z-other.z,
  }
endDef

def Vector3.operator* takes factor
  return Vector3 {
    x: x*factor,
    y: y*factor,
    z: z*factor,
  }
endDef

def Vector3.operator== takes other
  if other is! Vector3 return false;
  return x == other.x && y == other.y && z = other.z
endDef

def Vector3.dot takes other
endDef

def Vector3.cross takes other
endDef

def Vector3.ceil
  return Vector3 {
    x: ceil(x),
    y: ceil(y),
    z: ceil(z),
  }
endDef

def Vector3.floor
  return Vector3 {
    x: floor(x),
    y: floor(y),
    z: floor(z),
  }
endDef

def Vector3.round
  return Vector3 {
    x: round(x),
    y: round(y),
    z: round(z),
  }
endDef

def Vector3.abs
  return Vector3 {
    x: abs(x),
    y: abs(y),
    z: abs(z),
  }
endDef

def Vector3.toThePowerOf power
  return Vector3 {
    x: pow(x, power),
    y: pow(y, power),
    z: pow(z, power),
  }
endDef

def Vector3.distanceFrom other
  throw "Unimplemented method"
endDef

def Vector3.lengthSquared
  return data.dot data
endDef

def Vector3.length
  return sqrt(lengthSquared)
endDef

def Vector3.fastLength
  return sqrt(lengthSquared)
endDef

def Vector3.normalise
  return data * 1/length
endDef

def Vector3.toArray
  return [x, y, z]
endDef

