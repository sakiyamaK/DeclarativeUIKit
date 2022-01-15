Pod::Spec.new do |spec|
  spec.name         = "DeclarativeUIKit"
  spec.version      = "0.17.0"
  spec.summary      = "Library for writing UIKit Autolayout declaratively."

  spec.description  = <<-DESC

  UIKitのプロジェクトからSwiftUIに移行するためには根本の設計から変える必要がある場合があり、さらにUIKitからSwiftUIやSwiftUIからUIKitの相互の連携がどうしても必要になります。
  またSwiftUIはCombineを用いたMVVM設計を基本とするため、それ以外のアーキテクチャを採用していたりリアクティブプログラミングの学習が十分でないプロジェクトの場合、導入の敷居が高くなります。
  そのためUIKitをメインとして既存のレイアウトの定義だけを宣言的に記述できるライブラリとしました。

  In order to migrate from a UIKit project to SwiftUI, it may be necessary to change the underlying design, and furthermore, the interworking of UIKit to SwiftUI and SwiftUI to UIKit is inevitable.
  In addition, since SwiftUI is based on MVVM design using Combine, projects that use other architectures or have not sufficiently learned reactive programming will have a higher threshold for implementation.
  For this reason, we decided to use UIKit as the main library where only the existing layout definitions can be written declaratively.
DESC

  spec.homepage     = "https://github.com/sakiyamaK/DeclarativeUIKit"
  spec.license         = { :type => 'MIT', :file => 'LICENSE' }
  spec.author          = { 'Kei Sakiyama' => 'sakiyama.k@gmail.com' }
  spec.source          = { :git => 'https://github.com/sakiyamaK/DeclarativeUIKit.git', :tag => spec.version.to_s }

  spec.ios.deployment_target = '11.0'
  spec.source_files = 'Sources/DeclarativeUIKit/**/*'
  spec.swift_versions = '5.5'
end
