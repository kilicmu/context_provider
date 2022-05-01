## only_store

Easy to use status management tool, Depends on the flutter.

## Getting started

add dep: only_store. then:

1. create a new store class, which extends Provider:

```dart
import 'package:only_store/only_store.dart';

class Store extends Provider {
  int counter = 1;

  asyncIncrement() {
    Future.delayed(const Duration(seconds: 2)).then((res) {
      counter++;
      $notify();
    });
  }

  increment() {
    counter++;
    $notify();
  }

  reduce() {
    counter--;
  }

  @override
  toString() {
    // stringify as inspect log
    return "counter: $counter";
  }
}
```

The store has two parts: data and actions. 

Data is some of the properties defined on class Store.

Action is a function which host on Store instance.

You should extends Provider, it bring a function: $notify. you can use it to sync view when the data changes should reflect to view.

2. get instance of Store.

```dart
final store = Store();
```

3. create consumer of store instance.

```dart
final useStore = createConsumer(store);
```

4. use consumer on where you want to subscribe data change.

```dart
useStore((store, context) {
    return Text('${store.counter}');
}),
```

5. use store to eval action.

```dart
TextButton(
    onPressed: () {
        store.increment();
    },
    child: const Text("hello"));
```

As you can see, it's so easy.

## PENDING TODO: 

* middleware supports