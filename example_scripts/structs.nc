// A simple program to demonstrate the use of structs in nightScript
//
// The nightScript team

// General rule: A struct can only mixin with one other struct.

// Empty struct
struct Item

// Method on Item struct
def Item.use
  throw "Implement use method for ${typeOf data} struct"
endDef

// Structs can mixin with other structs
struct Chest with Item has contents

// Override the use method for Chest item
def Chest.use
  // data is synonymous to the 'this' keyword found in most programming languages
  print "$data has ${contents.length} items."
endDef

struct Sword with Item

def Sword.damage
  return 5
endDef

def Sword.use
  print "$data dealt $damage damage."
endDef

struct DiamondSword with Sword
def DiamondSword.damage
  return 50
endDef

// Main

// Create a new struct
let chest = Chest {
  contents: [
    DiamondSword {}
    Sword {}
  ]
}

chest.use

forEach item in chest.contents
  item.use
endForEach

