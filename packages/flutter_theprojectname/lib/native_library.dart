import 'dart:ffi';
import 'package:flutter/foundation.dart';

/// Load and get the library containing all the Rust code.
DynamicLibrary getNativeLibrary() => _nativeLibrary ??= _loadNativeLibrary();

DynamicLibrary? _nativeLibrary;

DynamicLibrary _loadNativeLibrary() {
  final library = switch (defaultTargetPlatform) {
    TargetPlatform.android => DynamicLibrary.open('libtheprojectname.so'),
    TargetPlatform.iOS => DynamicLibrary.process(),
    TargetPlatform.macOS => DynamicLibrary.open('libtheprojectname.dylib'),
    TargetPlatform.linux => DynamicLibrary.open('libtheprojectname.so'),
    TargetPlatform.windows => DynamicLibrary.open('theprojectname.dll'),
    _ => throw UnimplementedError()
  };
  return library;
}
