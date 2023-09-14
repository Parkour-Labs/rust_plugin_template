import 'package:flutter_test/flutter_test.dart';
import 'package:theprojectname/native_bindings.dart';
import 'package:theprojectname/native_library.dart';

/// These tests must be run with native binaries bundled alongside.
/// This can be done with `flutter test integration_test`.
void main() {
  test('function call', () {
    assert(NativeBindings(getNativeLibrary()).add(2, 3) == 5);
  });
}
