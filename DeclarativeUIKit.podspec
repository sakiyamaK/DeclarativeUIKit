Pod::Spec.new do |spec|
  spec.name         = 'DeclarativeUIKit'
  spec.version      = '0.23.0'
  spec.summary      = <<-DESC
  Library for writing UIKit Autolayout declaratively.
  DESC
  spec.description  = <<-DESC
  Library for writing UIKit Autolayout declaratively.
  DESC
  spec.homepage     = 'https://github.com/sakiyamaK/DeclarativeUIKit'
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author       = { 'Kei Sakiyama' => 'sakiyama.k@gmail.com' }
  spec.source       = { :git => 'https://github.com/sakiyamaK/DeclarativeUIKit.git', :tag => spec.version.to_s }
  spec.ios.deployment_target = '11.0'
  spec.source_files = 'Sources/DeclarativeUIKit/**/*'
  spec.swift_versions = '5.5'
  spec.static_framework = true
end
