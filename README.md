# event_source

W3C [EventSource][] client implementation for Dart / Flutter.

> This package depends on `dart:io`, so it is not usable on the Web.
> If you'd like to contribute a wrapper around [`dart:html`'s EventSource](https://api.dartlang.org/stable/2.0.0/dart-html/EventSource-class.html), feel free!

## Install

Add to your `pubspec.yaml`:

```yaml
dependencies:
  event_source: ^1.0.0
```

## Usage

```dart
import 'dart:async';
import 'package:event_source/event_source.dart';

final events = EventSource(Uri.parse('http://api.example.com/ssedemo.php'));

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
