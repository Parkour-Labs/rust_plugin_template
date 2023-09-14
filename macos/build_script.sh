rustup target add aarch64-apple-darwin x86_64-apple-darwin
export MACOSX_DEPLOYMENT_TARGET=10.11 && cd ../native/ && cargo build --target aarch64-apple-darwin --release
export MACOSX_DEPLOYMENT_TARGET=10.11 && cd ../native/ && cargo build --target x86_64-apple-darwin --release

rm "theprojectname.dylib"
lipo \
  "../native/target/aarch64-apple-darwin/release/theprojectname.dylib" \
  "../native/target/x86_64-apple-darwin/release/theprojectname.dylib" \
  -create \
  -output "theprojectname.dylib"
