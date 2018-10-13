import 'dart:io';
import 'package:test/test.dart';
import 'package:w3c_event_source/event_source.dart';

List<String> _responses = [];

void main() {
  HttpServer server;
  Uri url;
  setUp(() async {
    server = await HttpServer.bind('localhost', 0);
    server.listen((request) {
      request.response.bufferOutput = false;
      _responses.forEach((line) {
        request.response.write('$line\n');
      });
    });
    url = Uri.parse("http://${server.address.host}:${server.port}");
  });

  tearDown(() async {
    await server.close(force: true);
    server = null;
    url = null;
    _responses.clear();
  });

  test('opens and closes connection when listening on `events`', () async {
    final data = 'example data';

    _responses = [
      'retry:10000',
      'id:34',
      'data:$data',
      '',
    ];

    final source = EventSource(url);
    final message = await source.events.first;
    expect(message.data, equals(data));
    expect(source.readyState, equals(EventSource.CLOSED));
  });

  test('reconnects with Last-Event-ID', () async {
    _responses = [
      'retry:500',
      'id:10',
      'data:example',
      '',
    ];

    final source = EventSource(url);
    final events = source.events.asBroadcastStream();
    final first = events.elementAt(0);
    final second = events.elementAt(1);

    final message = await first;
    expect(message.data, equals('example'));

    // Kill the connection
    final port = server.port;
    await server.close(force: true);
    server = await HttpServer.bind('localhost', port);
    server.listen((request) {
      expect(request.headers.value('Last-Event-ID'), equals('10'));
      request.response.bufferOutput = false;
      request.response.write('data:back\n\n');
    });

    final message2 = await second;
    expect(message2.data, equals('back'));
  });
}
