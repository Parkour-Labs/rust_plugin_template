rustup target add aarch64-apple-darwin x86_64-apple-darwin
export MACOSX_DEPLOYMENT_TARGET=10.13 && cd ../../ && cargo build --target aarch64-apple-darwin --release
export MACOSX_DEPLOYMENT_TARGET=10.13 && cd ../../ && cargo build --target x86_64-apple-darwin --release

rm "theprojectname.dylib"
lipo \
  "../../target/aarch64-apple-darwin/release/theprojectname.dylib" \
  "../../target/x86_64-apple-darwin/release/theprojectname.dylib" \
  -create \
  -output "theprojectname.dylib"
