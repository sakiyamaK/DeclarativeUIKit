
import UIKit
import DeclarativeUIKit

final class ToggleRow: UICollectionViewCell {

    private weak var switchView: UISwitch!
    
    var toggleAction: ((Bool) -> Void)? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.declarative(priorities: .init(bottom: .defaultLow)) {
            UIStackView.vertical {
                UIView.spacer()
                
                UIStackView.horizontal {
                    UILabel("Favorites only")
                    
                    UIView.spacer()
                    
                    UISwitch(assign: &self.switchView)
                        .addAction(.valueChanged, handler: { [weak self] action in
                            guard let switchView = action.sender as? UISwitch else {
                                return
                            }
                            self!.toggleAction?(switchView.isOn)
                        })
                }
                .alignment(.center)
                
                UIView.divider()
            }
            .spacing(10)
            .height(50)
        }
    }
    
    func configure(isOn: Bool) {
        switchView.isOn = isOn
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

import SwiftUI

#Preview(traits: .fixedLayout(width: 300, height: 50), body: {
    let row = ToggleRow()
    row.configure(isOn: true)
    return row
})
