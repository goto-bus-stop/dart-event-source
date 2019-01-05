# w3c_event_source

[![pub package][0]][1]
[![build status][2]][3]

[0]: https://img.shields.io/pub/v/w3c_event_source.svg?style=flat-square
[1]: https://pub.dartlang.org/packages/w3c_event_source
[2]: https://img.shields.io/travis/com/goto-bus-stop/dart-event-source/default.svg?style=flat-square
[3]: https://travis-ci.com/goto-bus-stop/dart-event-source

W3C [EventSource][] client implementation for Dart / Flutter.

> This package depends on `dart:io`, so it is not usable on the Web.
> If you'd like to contribute a wrapper around [`dart:html`'s EventSource](https://api.dartlang.org/stable/2.0.0/dart-html/EventSource-class.html), feel free!

## Install

Add to your `pubspec.yaml`:

```yaml
dependencies:
  w3c_event_source: ^1.2.1
```

## Usage

```dart
import 'dart:async';
import 'package:w3c_event_source/event_source.dart';

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
