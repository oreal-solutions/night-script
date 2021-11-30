// A simple program to demonstrate generics in nightScript
//
// The nightScript authors

struct CustomCollection<T is Comparable> {
  final _buffer: List<T>,
}

static func CustomCollection.empty<T is Comparable>(): CustomCollection<T> {
  return {
    _buffer: List.empty()
  }
}

func CustomCollection.add(item: T) {
  _buffer.add(item)
}

func CustomCollection.removeType(of: type) {
  _buffer.removeWhere(item => item is of)
}

func CustomCollection.toString() => _buffer.toString()

func main() {
  let collection = CustomCollection.empty<num>()

  collection.add(4)
  collection.add(2.0)
  collection.add(0.5)

  // Arguments can be named
  collection.removeType(of: num)

  // [4]
  print(collection)
}