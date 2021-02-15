Pod::Spec.new do |s|
  s.name             = 'TAReactorKitHelper'
  s.version          = '0.2.2'
  s.summary          = 'TAReactorKitHelper.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TAReactorKitHelper. That's it...
                       DESC

  s.homepage         = 'https://www.tailored-apps.com'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Dominik Arnhof' => 'da@tailored-apps.com', 'Mario Hahn' => 'mh@tailored-apps.com' }
  s.source           = { :git => 'https://github.com/tailoredmedia/TAReactorKitHelper.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.tvos.deployment_target = '9.0'
  s.osx.deployment_target = "10.11"
  s.watchos.deployment_target = '3.0'

  s.source_files = 'TAReactorKitHelper/**/*.swift'

  s.dependency 'ReactorKit'

  s.swift_versions = "5.0"

  s.test_spec 'Tests' do |test_spec|
    test_spec.ios.deployment_target = '9.0'
    test_spec.tvos.deployment_target = '9.0'
    test_spec.osx.deployment_target = '10.11'
    test_spec.source_files = 'TAReactorKitHelperTests/**/*.swift'
  end
end
