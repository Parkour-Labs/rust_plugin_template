# Rust Flutter FFI plugin template

Shared template for all our Rust Flutter FFI plugins.

Contains configurations for building and bundling on Windows (x64 only), Linux (x64 only), Android, iOS and macOS. Web is not supported.

## Getting Started

Replace across the project **all occurrences** of `theprojectname` to a desired project name. The name should contain only lowercase letters and underscores.

(TODO: provide a script for renaming)

## Project structure

This template uses the following structure:

- `packages/theprojectname`: contains the native source code, and a `Cargo.toml` file for building that source code into a static or dynamic library.
- `packages/flutter_theprojectname`: contains the Dart code that defines the API of the plugin, and which calls into the native code using `dart:ffi`.
  - Platform folders (`android`, `ios`, `windows`, etc.): contains the build files for building and bundling the native code library with the platform application.
    - Android: Flutter -> Gradle (`build.gradle`) -> CMake (`CMakeLists.txt`) -> Cargo NDK -> Cargo
    - iOS: Flutter -> CocoaPods (`*.podspec`) -> `build_script.sh` -> Cargo
    - macOS: Flutter -> CocoaPods (`*.podspec`) -> `build_script.sh` -> Cargo
    - Linux: Flutter -> CMake (`CMakeLists.txt`) -> Cargo
    - Windows: Flutter -> CMake (`CMakeLists.txt`) -> Cargo

