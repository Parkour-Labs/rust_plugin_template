# The Flutter tooling requires that developers have a version of Visual Studio
# installed that includes CMake 3.14 or later. You should not increase this
# version, as doing so will cause the plugin to fail to compile for some
# customers of the plugin.
cmake_minimum_required(VERSION 3.14)

# Project-level configuration.
project("flutter_theprojectname")

# Invoke the build for native code.
add_custom_target("theprojectname"
  ALL
  WORKING_DIRECTORY "../../"
  COMMAND "rustup target add x86_64-pc-windows-msvc i686-pc-windows-msvc aarch64-pc-windows-msvc"
  COMMAND "cargo build --out-dir ${LIBRARY_OUTPUT_DIRECTORY} --target x86_64-pc-windows-msvc --release"
  # COMMAND "cargo build --out-dir ${LIBRARY_OUTPUT_DIRECTORY} --target i686-pc-windows-msvc --release"
  # COMMAND "cargo build --out-dir ${LIBRARY_OUTPUT_DIRECTORY} --target aarch64-pc-windows-msvc --release"
)

# List of absolute paths to libraries that should be bundled with the plugin.
set("flutter_theprojectname_bundled_libraries"
  "${LIBRARY_OUTPUT_DIRECTORY}/theprojectname.dll"
  PARENT_SCOPE
)
