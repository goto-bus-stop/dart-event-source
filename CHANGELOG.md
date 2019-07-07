# w3c_event_source change log

All notable changes to this project will be documented in this file.

This project adheres to [Semantic Versioning](http://semver.org/).

## 1.3.2
* Prepare for upcoming Uint8List change to HttpClientResponse. ([@tvolkert](https://github.com/tvolkert))

## 1.3.1
* Prepare for upcoming change to HttpRequest and HttpClientResponse. ([@tvolkert](https://github.com/tvolkert))

## 1.3.0
* Delay reconnecting with randomized exponential backoff. ([@mpx](https://github.com/mpx))
* Reconnect after event stream request ends. ([@mpx](https://github.com/mpx))
* Reconnect after protocol errors (invalid UTF-8, non-200 OK status codes). ([@mpx](https://github.com/mpx))
* Stop event stream after 204 No Content. ([@mpx](https://github.com/mpx))
* Ensure resources are released for old connections. ([@mpx](https://github.com/mpx))

## 1.2.2
* Revert `data` event commit, which was a misreading of the spec. ([@mpx](https://github.com/mpx))

## 1.2.1
* Ensure `data` event data ends in \n per the spec. ([@mpx](https://github.com/mpx))
* Fix event name bug in multiline data messages. ([@mpx](https://github.com/mpx))

## 1.2.0
* Allow passing in a custom HttpClient factory. ([@mpx](https://github.com/mpx))

## 1.1.0
* Implement auto-reconnect.

## 1.0.0
* Initial release.
