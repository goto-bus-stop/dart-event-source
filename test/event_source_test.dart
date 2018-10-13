import 'dart:io';
import 'package:test/test.dart';
import 'package:event_source/event_source.dart';

List<String> _responses = [];

void main() {
  HttpServer server;
  Uri url;
  setUp(() async {
    server = await HttpServer.bind('localhost', 0);
    server.listen((request) {
      _responses.forEach((line) {
        request.response.write('$line\n');
      });
      request.response.close();
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
}
