Pod::Spec.new do |spec|
  spec.name         = "DeclarativeUIKit"
  spec.version      = "0.17.1"
  spec.summary      = "Library for writing UIKit Autolayout declaratively."
  spec.description  = "Library for writing UIKit Autolayout declaratively."
  spec.homepage     = "https://github.com/sakiyamaK/DeclarativeUIKit"
  spec.license         = { :type => 'MIT', :file => 'LICENSE' }
  spec.author          = { 'Kei Sakiyama' => 'sakiyama.k@gmail.com' }
  spec.source          = { :git => 'https://github.com/sakiyamaK/DeclarativeUIKit.git', :tag => spec.version.to_s }
  spec.ios.deployment_target = '11.0'
  spec.source_files = 'Sources/DeclarativeUIKit/**/*'
  spec.swift_versions = '5.5'
end
