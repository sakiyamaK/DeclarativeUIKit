
import UIKit
import DeclarativeUIKit

final class ToggleRow: UICollectionViewCell {
    private enum ViewTag: Int {
        case toggle = 1
    }
    
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

                    UISwitch()
                    .tag(ViewTag.toggle.rawValue)
                }
                .alignment(.center)
                
                UIView.spacer().height(0.5).backgroundColor(.lightGray)
            }
            .spacing(10)
            .height(50)
        }
    }
            
    func configure(isOn: Bool) {
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        cell.configure(isOn: true)
    }
}

struct ToggleRow_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            ForEach(0..<2) { idx in
                View_Wrapper(isOn: true)
            }
        }
        .previewLayout(.fixed(width: 300, height: 50))
    }
}
