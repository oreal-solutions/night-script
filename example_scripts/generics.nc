// A simple program to demonstrate generics in nightScript
//
// The nightScript authors

struct CustomCollection<T is Comparable> {
  final _buffer: list<T>;
}

static function CustomCollection<T is Comparable>.empty(): CustomCollection<T> {
  return {
    _buffer: List.empty();
  }
}

function CustomCollection<T is Comparable>.add(item: T) {
  _buffer.add(item);
}

// Defaults to CustomCollection<Comparable>
function CustomCollection.removeType(of: type) {
  _buffer.removeWhere(item => item is of);
}

function CustomCollection.toString() => _buffer.toString();

function main() {
  let collection = CustomCollection<num | int>.empty();

  collection.add(4);
  collection.add(2.0);
  collection.add(0.5);

  // Arguments can be named
  collection.removeType(of: num);

  // [4]
  print(collection);
}
