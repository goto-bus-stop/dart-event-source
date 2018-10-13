# event_source

W3C [EventSource][] client implementation for Dart / Flutter.

## Usage

```dart
import 'dart:async';
import 'package:event_source/event_source.dart';

final events = EventSource(Uri.parse());

// Listening on the `events` stream will open a connection.
final subscription = events.events.listen((MessageEvent message) {
  print('${message.name}: ${message.data}');
});

Timer(Duration(seconds: 30), () {
  // Canceling the subscription closes the connection.
  subscription.cancel();
});
```

## License

[MIT](./LICENSE)

[EventSource]: https://developer.mozilla.org/en-US/docs/Web/API/EventSource
