rustup target add aarch64-apple-ios aarch64-apple-ios-sim x86_64-apple-ios
export IPHONEOS_DEPLOYMENT_TARGET=11.0 && cd ../../ && cargo build --target aarch64-apple-ios --release
export IPHONEOS_DEPLOYMENT_TARGET=11.0 && cd ../../ && cargo build --target aarch64-apple-ios-sim --release
export IPHONEOS_DEPLOYMENT_TARGET=11.0 && cd ../../ && cargo build --target x86_64-apple-ios --release

rm "theprojectname.xcframework"
xcodebuild \
  -library "../../target/aarch64-apple-ios/release/libtheprojectname.a" \
  -library "../../target/aarch64-apple-ios-sim/release/libtheprojectname.a" \
  -library "../../target/x86_64-apple-ios/release/libtheprojectname.a" \
  -create-xcframework \
  -output "theprojectname.xcframework"
