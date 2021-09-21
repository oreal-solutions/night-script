// A simple program to demonstrate generics in nightScript
//
// The nightScript authors

struct CustomCollection<T is Comparable> {
  final _buffer: List<T>,
}

def newEmptyCollection<T is Comparable> -> CustomCollection<T> {
  _buffer: newEmptyList<T>
}

def CustomCollection.add item {
  _buffer.add item
}

def CustomCollection.removeType of: type {
  _buffer.removeWhere item -> item is of
}

def CustomCollection.toString -> _buffer.toString

def main {
  let collection = newEmptyCollection<num>

  collection.add 4
  collection.add 2.0
  collection.add 0.5

  collection.removeType of double

  // [4]
  print collection
}