// A simple program to demonstrate the use of structs in nightScript
//
// The nightScript team

// General rule: A struct can only mixin with one other struct.

// Empty struct
struct Item

// Method on Item struct
def Item.use {
  throw "Implement use method for ${typeOf data} struct"
}

// Structs can mixin with other structs
struct Chest with Item has contents: List

// Override the use method for Chest item
def Chest.use {
  // data is synonymous to the 'this' keyword found in most programming languages
  print "$data has ${contents.length} items."
}

struct Sword with Item

def Sword.damage {
  -> 5
}

def Sword.use {
  print "$data dealt $damage damage."
}

struct DiamondSword with Sword
def DiamondSword.damage {
  -> 50
}


def main {
  // Create a new struct
  let chest = Chest {
    contents: [
      DiamondSword {}
      Sword {}
    ]
  }

  chest.use

  for item in chest.contents {
    item.use
  }
}

