#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_theprojectname.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_theprojectname'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter FFI plugin project.'
  s.description      = <<-DESC
A new Flutter FFI plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }

  s.dependency 'FlutterMacOS'
  s.platform = :osx, '10.13'
  s.source = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.script_phase = {
    :name => 'Build Rust library',
    :script => 'sh build_script.sh',
    :execution_position => :before_compile,
    :output_files => ["${BUILT_PRODUCTS_DIR}/theprojectname.dylib"],
  }
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
