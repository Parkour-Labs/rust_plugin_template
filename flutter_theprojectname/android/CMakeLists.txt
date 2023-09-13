# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

# Project-level configuration.
project(flutter_theprojectname)

# Invoke the build for native code.
add_custom_target(theprojectname
  ALL
  WORKING_DIRECTORY ../../
  COMMAND rustup target add x86_64-linux-android i686-linux-android aarch64-linux-android armv7-linux-androideabi
  COMMAND cargo install cargo-ndk
  COMMAND cargo ndk --output-dir ${LIBRARY_OUTPUT_DIRECTORY} --target x86_64-linux-android build --release
  COMMAND cargo ndk --output-dir ${LIBRARY_OUTPUT_DIRECTORY} --target i686-linux-android build --release
  COMMAND cargo ndk --output-dir ${LIBRARY_OUTPUT_DIRECTORY} --target aarch64-linux-android build --release
  COMMAND cargo ndk --output-dir ${LIBRARY_OUTPUT_DIRECTORY} --target armv7-linux-androideabi build --release
)
