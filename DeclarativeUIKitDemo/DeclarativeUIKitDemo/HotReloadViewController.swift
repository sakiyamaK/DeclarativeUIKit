//
//  HotReloadViewController.swift
//  DeclarativeUIKitDemo
//
//  Created by sakiyamaK on 2022/03/06.
//

import UIKit
import DeclarativeUIKit
//                UIButton(
//                    configuration:
//                            .plain()
//                            .title("stackview1 font 20")
////                            .buttonSize(.large)
//                    ,
//                    primaryAction: nil
//                )

//                    UIButton(
//                        configuration:
//                                .plain()
//                                .title("stackview2 font 30")
////                                .buttonSize(.large)
//                        ,
//                        primaryAction: nil
//                    )

final class HotReloadViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        UILabel.appearance(whenContainedInInstancesOf: [Self.self])
            .font(.boldSystemFont(ofSize: 20))
            .textColor(.red)
            .contentPriorities(.init(vertical: .required))

        self.declarative {

            UIStackView(
                spacing: 8,
                arrangedSubViewConfiguration: .init(
                    contentPriorities: .init(vertical: .required)
                )
            ) {

                UISearchTextField("stack1 label 20")

                UITextView("stack1 text 13")
                    .font(.systemFont(ofSize: 13))
                    .isScrollEnabled(false)
                    .textColor(.black)

                UILabel("stack1 label 20")
                    .textColor(.black)

                UILabel("stack1 label 30")
                    .font(.systemFont(ofSize: 30))

                UIButton(configuration: .bordered().buttonSize(.medium).title("uhooo"))
                    .customSpacing(40)

                UIStackView(
                    spacing: 8,
                    arrangedSubViewConfiguration: .init(
                        font: .systemFont(ofSize: 30),
                        contentPriorities: .init(vertical: .required)
                    )
                ) {

                    UISearchTextField("stack2 textfield 30")

                    UILabel("stack2 label 30")
                    UILabel("stack2 label 30")
                    UILabel("stack2 label 40")
                        .font(.systemFont(ofSize: 40))
                }
                .backgroundColor(.red.withAlphaComponent(0.2))
                .customSpacing(40)

                UILabel("stack1 label 20")
                UILabel("stack1 label 20")

                UIView.spacer()
                    .height(2, priority: .defaultHigh)
            }
            .isLayoutMarginsRelativeArrangement(true)
            .margins(.init(horizontal: 20))
            .backgroundColor(.blue.withAlphaComponent(0.2))
        }
    }
}
#Preview {
    HotReloadViewController()
}

