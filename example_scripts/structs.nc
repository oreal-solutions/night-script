// A simple program to demonstrate the use of structs in nightScript
//
// The nightScript team

// General rule: A struct can only mixin with one other struct.

// Empty struct
struct Item {}

// Method on Item struct
function Item.use() {
  throw "Implement use method for ${typeOf this} struct";
}

// Structs can mixin with other structs
struct Chest with Item {
  contents: list;
}

// Override the use method for Chest item
function Chest.use() {
  // data is synonymous to the 'this' keyword found in most programming languages
  print("$this has ${contents.length} items.");
}

struct Sword with Item {}

getter Sword.damage {
  return 5;
}

function Sword.use() {
  print("$this dealt $damage damage.");
}

struct DiamondSword with Sword {}
getter DiamondSword.damage {
  return 50;
}


function main() {
  // Create a new struct
  let chest = Chest {
    contents: [
      DiamondSword {},
      Sword {},
    ]
  }

  chest.use();

  for item in chest.contents {
    item.use();
  }
}

