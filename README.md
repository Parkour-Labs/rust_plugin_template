# Rust Flutter FFI plugin template

[![android](https://github.com/Parkour-Labs/rust_plugin_template/actions/workflows/android.yml/badge.svg)](https://github.com/Parkour-Labs/rust_plugin_template/actions/workflows/android.yml)

[![ios](https://github.com/Parkour-Labs/rust_plugin_template/actions/workflows/ios.yml/badge.svg)](https://github.com/Parkour-Labs/rust_plugin_template/actions/workflows/ios.yml)

[![desktop](https://github.com/Parkour-Labs/rust_plugin_template/actions/workflows/desktop.yml/badge.svg)](https://github.com/Parkour-Labs/rust_plugin_template/actions/workflows/desktop.yml)

Shared template for all our Rust Flutter FFI plugins.

Contains configurations for building and bundling on Windows, Linux, Android, iOS and macOS. Web is not supported.

## Getting Started

Replace across the project **all occurrences** of `theprojectname` to a desired project name. The name should contain only lowercase letters and underscores.

(TODO: provide a script for renaming)

## Project structure

This template uses the following structure:

- `lib`: contains the Dart code that defines the API of the plugin, and which calls into the native code using `dart:ffi`.
- `native`: contains the native source code, and a `Cargo.toml` file for building that source code into a static or dynamic library.
- Platform folders (`android`, `ios`, `windows`, etc.): contains the build files for building and bundling the native code library with the platform application.
- Example folder (`example`): contains an example project.

Build systems involved on different platforms:

- Android (cross-compile): Flutter → Gradle (`build.gradle`) → [CargoKit](https://matejknopp.com/post/flutter_plugin_in_rust_with_no_prebuilt_binaries/) → Cargo
- iOS (cross-compile): Flutter → CocoaPods (`*.podspec`) → [CargoKit](https://matejknopp.com/post/flutter_plugin_in_rust_with_no_prebuilt_binaries/) → Cargo
- macOS (cross-compile): Flutter → CocoaPods (`*.podspec`) → [CargoKit](https://matejknopp.com/post/flutter_plugin_in_rust_with_no_prebuilt_binaries/) → Cargo
- Linux: Flutter → CMake (`CMakeLists.txt`) → Cargo
- Windows: Flutter → CMake (`CMakeLists.txt`) → Cargo
