//
//  EnrionmentViewController.swift
//  DeclarativeUIKit
//
//  Created by sakiyamaK on 2025/08/06.
//

import UIKit
import DeclarativeUIKit

import SwiftUI
extension EnvironmentValues {
    @Entry var fontColor: UIColor = .systemBlue
}

final class CustomView: UIView {
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //
    // これが使えない!!!!
    //
    @Environment(\.fontColor) var color

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.declarative {
            UILabel().text("入れ子構造のUILabel")
                .textAlignment(.center)
                .readEnvironment(\.fontColor, { label, value in
                    label.textColor = value
                })
        }
    }
}

///* ********************
// 環境変数のkey
//******************** */
//private struct ThemeColorKey: UIKitEnvironmentKey {
//    static let defaultValue: UIColor = .systemBlue
//}
//
//private struct ThemeColorKey2: SwiftUI.EnvironmentKey {
//    static let defaultValue: UIColor = .systemBlue
//}

final class EnvironmentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.declarative {
            UIStackView.vertical {
                UILabel("自身のLabel!")
                    .textAlignment(.center)
                    .readEnvironment(\.fontColor) { label, value in
                        label.textColor = value
                    } // 環境変数の読み込み

                CustomView()
                    .environment(\.fontColor, .green)
            }
            .spacing(16)
            .centerY()
        }
        .environment(\.fontColor, .red) // 環境変数を設定
    }
}

#Preview {
    EnvironmentViewController()
}
