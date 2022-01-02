
import UIKit
import DeclarativeUIKit

final class ToggleRow: UICollectionViewCell {
    private enum ViewTag: Int {
        case toggle = 1
    }
    
    var toggleAction: ((Bool) -> Void)? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.declarate(priorities: .init(bottom: .defaultLow)) {
            UIStackView.vertical {
                UIView.spacer()
                
                UIStackView.horizontal {
                    UILabel {
                        let label = $0 as! UILabel
                        label.text = "Favorites only"
                    }
                    
                    UIView.spacer()
                    
                    UISwitch {
                        let switchView = $0 as! UISwitch
                        switchView.addTarget(self, action: #selector(_toggleAction), for: .valueChanged)
                    }
                    .tag(ViewTag.toggle.rawValue)
                }
                .alignment(.center)
                
                UIView.divider()
            }
            .spacing(10)
            .height(50)
        }
    }
    
    func configure(isOn: Bool) {
        let switchView = self.getView(tag: ViewTag.toggle.rawValue) as! UISwitch
        switchView.isOn = isOn
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func _toggleAction(_ sender: UISwitch){
        self.toggleAction?(sender.isOn)
    }
}

import SwiftUI

private struct View_Wrapper: UIViewRepresentable {
    typealias View = ToggleRow
    var isOn: Bool
    
    func makeUIView(context: Context) -> View {
        return View.init(frame: .zero)
    }
    
    func updateUIView(_ cell: View, context: Context) {
        cell.configure(isOn: isOn)
    }
}

struct ToggleRow_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            ForEach(0..<2) { idx in
                View_Wrapper(isOn: idx%2 == 0)
            }
        }
        .previewLayout(.fixed(width: 300, height: 50))
    }
}
