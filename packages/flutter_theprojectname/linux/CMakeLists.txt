# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

# Project-level configuration.
project("flutter_theprojectname")

# Invoke the build for native code.
add_custom_target("theprojectname"
  ALL
  WORKING_DIRECTORY "../../"
  COMMAND "rustup target add x86_64-unknown-linux-gnu i686-unknown-linux-gnu aarch64-unknown-linux-gnu"
  COMMAND "cargo build --out-dir ${LIBRARY_OUTPUT_DIRECTORY} --target x86_64-unknown-linux-gnu --release"
  # COMMAND "cargo build --out-dir ${LIBRARY_OUTPUT_DIRECTORY} --target i686-unknown-linux-gnu --release"
  # COMMAND "cargo build --out-dir ${LIBRARY_OUTPUT_DIRECTORY} --target aarch64-unknown-linux-gnu --release"
)

# List of absolute paths to libraries that should be bundled with the plugin.
set("flutter_theprojectname_bundled_libraries"
  "${LIBRARY_OUTPUT_DIRECTORY}/libtheprojectname.so"
  PARENT_SCOPE
)
