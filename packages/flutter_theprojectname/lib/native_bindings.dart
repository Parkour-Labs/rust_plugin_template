// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';

class NativeBindings {
  final Pointer<T> Function<T extends NativeType>(String symbol) _lookup;

  NativeBindings(DynamicLibrary library) : _lookup = library.lookup;

  /// Library function goes here.
  late final add = _lookup<NativeFunction<Uint64 Function(Uint64, Uint64)>>('theprojectname_add')
      .asFunction<int Function(int a, int b)>(isLeaf: true);
}
