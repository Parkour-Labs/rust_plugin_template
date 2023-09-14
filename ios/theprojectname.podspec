#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint theprojectname.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'theprojectname'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter FFI plugin project.'
  s.description      = <<-DESC
A new Flutter FFI plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }

  s.dependency 'Flutter'
  s.platform = :ios, '11.0'
  s.source = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.script_phase = {
    :name => 'Build native library',
    :script => 'sh "$PODS_TARGET_SRCROOT/../cargokit/build_pod.sh" ../native/ theprojectname',
    :execution_position => :before_compile,
    :input_files => ['${BUILT_PRODUCTS_DIR}/cargokit_phony'],
    # Let XCode know that the static library referenced in -force_load below is
    # created by this build step.
    :output_files => ["${BUILT_PRODUCTS_DIR}/libtheprojectname.a"],
  }
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386', # Flutter.framework does not contain a i386 slice.
    'OTHER_LDFLAGS' => '-force_load ${BUILT_PRODUCTS_DIR}/libtheprojectname.a',
  }
  s.swift_version = '5.0'
end
