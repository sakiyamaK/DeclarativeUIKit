//
//  ActorViewController.swift
//  DeclarativeUIKit
//
//  Created by sakiyamaK on 2024/12/28.
//

import UIKit
import DeclarativeUIKit

actor User {
    var name: String
    init(name: String) {
        self.name = name
    }
}

final class ActorView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Task {
            let user = User(name: "name")
            await self.declarative {
                await UIScrollView.vertical {
                    await UIStackView.vertical {
                        await (0...100).compactMapAsync { _ in
                            await UILabel(await user.name)
                        }
                    }
                }
            }
            
            after()
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func after() {
        print("after")
    }
}

final class ActorViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            let user = User(name: "name")
            await self.applyView({ view in
                view.backgroundColor(.white)
            }).declarative {
                await UIScrollView.vertical {
                    await UIStackView.vertical {
                        await (0...100).compactMapAsync { _ in
                            await UILabel(await user.name)
                                .zStack(layoutGuides: .init(all: .margins)) {
                                    await UILabel(await user.name)
                                }
                        }
                    }
                }
            }.floatingActionView {
                UIButton(configuration: .plain().title(await user.name))

            }
//            .declarative {
//                ActorView()
//            }
            
            after()
        }
    }
    
    func after() {
        print("after")
    }
}

extension Collection where Element: Sendable {
    func mapAsync<T: Sendable>(transform: @escaping @Sendable (Element) async -> T) async -> [T] {
        await withTaskGroup(of: T.self) { group in
            for element in self {
                group.addTask {
                    await transform(element)
                }
            }
            
            var results = [T]()
            for await result in group {
                results.append(result)
            }
            return results
        }
    }
    
    func compactMapAsync<T: Sendable>(transform: @escaping @Sendable (Element) async -> T?) async -> [T] {
        await withTaskGroup(of: T?.self) { group in
            for element in self {
                group.addTask {
                    await transform(element)
                }
            }
            
            var results = [T]()
            for await result in group {
                if let result {
                    results.append(result)
                }
            }
            return results
        }
    }
}

#Preview {
    ActorViewController()
}
