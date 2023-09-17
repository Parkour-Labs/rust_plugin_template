# Rust Flutter FFI plugin template

[![android](https://github.com/Parkour-Labs/rust_plugin_template/actions/workflows/android.yml/badge.svg)](https://github.com/Parkour-Labs/rust_plugin_template/actions/workflows/android.yml)

[![ios](https://github.com/Parkour-Labs/rust_plugin_template/actions/workflows/ios.yml/badge.svg)](https://github.com/Parkour-Labs/rust_plugin_template/actions/workflows/ios.yml)

[![desktop](https://github.com/Parkour-Labs/rust_plugin_template/actions/workflows/desktop.yml/badge.svg)](https://github.com/Parkour-Labs/rust_plugin_template/actions/workflows/desktop.yml)

Shared template for all our Rust Flutter FFI plugins.

Contains configurations for building and bundling on Windows, Linux, Android, iOS and macOS. Web is not supported.

## Getting Started

Replace across the project **all occurrences** of `theprojectname` to a desired project name. The name should contain only **lowercase letters and underscores**. This can be done via a small Rust script in `__init__`:

```sh
cd __init__

# Replace in `..` (excluding `../__init__` and `../.git`)
# all occurrences of `theprojectname` to `<your-project-name>`.
cargo run .. <your-project-name>
```

The `__init__` folder may now be deleted.

## Project structure

This template uses the following structure:

- `lib`: contains the Dart code that defines the API of the plugin, and which calls into the native code using `dart:ffi`.
- `native`: contains the native source code, and a `Cargo.toml` file for building that source code into a static or dynamic library.
- `android`, `ios`, `linux`, `macos`, `windows`: contains the build files for building and bundling the native library.
- `cargokit`: [contains glue for calling Cargo from Gradle/CocoaPods](https://matejknopp.com/post/flutter_plugin_in_rust_with_no_prebuilt_binaries/).
- `example`: contains an example project.
- `example/integration_test`: contains an integration test which calls native functions to check whether linking works correctly on all platforms.

Build systems involved on different platforms:

- Android (cross-compile): Flutter → Gradle (`build.gradle`) → CargoKit → Cargo
- iOS (cross-compile): Flutter → CocoaPods (`*.podspec`) → CargoKit → Cargo
- macOS (cross-compile): Flutter → CocoaPods (`*.podspec`) → CargoKit → Cargo
- Linux: Flutter → CMake (`CMakeLists.txt`) → Cargo
- Windows: Flutter → CMake (`CMakeLists.txt`) → Cargo
