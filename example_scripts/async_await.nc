// A simple program to demonstrate async await in nightScript
//
// The nightScript authors

// A future is a datatype that allows callers to listen for a task complete event.
// A future can complete successfully or with an error.
// futures can be listened to with 'then' and 'on' or 'catch' or can be awaited with
// 'await'.
//
// If a function uses 'await' it should be async and return a future.
// If a function is marked 'async' a future object is created when the function is
// called, unless the function returns its own future.

async func doSomethingHeavy(): future<int> {
  let n = 1000000
  while n > 0 {
    --n
  }

  return 0
}

func getFuture(): future<string> {
  // future() is understood by the compiler, and creates a new future.
  // i.e it is a language function just like 'function'.
  final fut = future((): string => {
    // Do all work here.
    // Errors thrown here will be propagated to the future
  })

  return fut
}

async func main() {
  // Await a future
  await doSomethingHeavy()

  // Use then to postpone execution
  // Note that .then and .onError return the same future
  // and can therefore be chained
  doSomethingHeavy().then((result) {
    print "We are done doing heavy, result is $result"
  }).onError((error) {
    if error is string {
      print "We got string error: $error\n$stacktrace"
    } else {
      print "Just a non string error: $error"
    }
  })
}