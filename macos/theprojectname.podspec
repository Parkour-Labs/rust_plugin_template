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

  s.dependency 'FlutterMacOS'
  s.platform = :osx, '10.11'
  s.source = { :path => '.' }     # Property is required but unused
  s.source_files = 'Classes/**/*' # Property is required but unused
  s.script_phase = {
    :name => 'Build native library',
    :script => 'sh build_script.sh',
    :execution_position => :before_compile,
    :output_files => ["${BUILT_PRODUCTS_DIR}/theprojectname.xcframework"],
  }
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end