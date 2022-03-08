import Foundation

import UIKit
import DeclarativeUIKit

final class GithubSearchCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier: String = "GithubSearchCollectionViewCell"
    
    private weak var fullNameLabel: UILabel!
    private weak var descriptionLabel: UILabel!
    private weak var starIconLabel: UILabel!
    private weak var languageIconLabel: UILabel!
    private weak var licenseLabel: UILabel!
    private weak var dateLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                        
        let BottomIconView = { (iconName: String, assign: inout UILabel?) -> UIView in
            UIStackView.horizontal {
                UIImageView(
                    UIImage(systemName: iconName)?.withRenderingMode(.alwaysTemplate).withTintColor(.black)
                ).contentMode(.scaleAspectFit)
                UILabel(assign: &assign)
                    .textAlignment(.left)
                    .font(UIFont.systemFont(ofSize: 15))
                    .contentHuggingPriority(.required, for: .vertical)
                    .contentCompressionResistancePriority(.required, for: .vertical)
            }
            .spacing(5)
        }
        
        self.contentView.declarative(priorities: .init(bottom: .defaultLow)) {
            UIStackView.vertical {
                UIStackView.vertical {
                    UILabel(assign: &fullNameLabel)
                        .textAlignment(.left)
                        .font(UIFont.systemFont(ofSize: 28))
                        .contentHuggingPriority(.required, for: .vertical)
                        .contentCompressionResistancePriority(.required, for: .vertical)
                    
                    UILabel(assign: &descriptionLabel)
                        .textAlignment(.left)
                        .font(UIFont.systemFont(ofSize: 18))
                        .contentHuggingPriority(.required, for: .vertical)
                        .contentCompressionResistancePriority(.required, for: .vertical)
                    
                    UIStackView.horizontal {
                        BottomIconView("star", &starIconLabel)
                        
                        BottomIconView("circle", &languageIconLabel)
                        
                        UILabel(assign: &licenseLabel)
                            .textAlignment(.left)
                            .font(UIFont.systemFont(ofSize: 15))
                            .contentHuggingPriority(.required, for: .vertical)
                            .contentCompressionResistancePriority(.required, for: .vertical)
                        
                        UILabel(assign: &dateLabel)
                            .textAlignment(.left)
                            .font(UIFont.systemFont(ofSize: 15))
                            .contentHuggingPriority(.required, for: .vertical)
                            .contentCompressionResistancePriority(.required, for: .vertical)
                            .contentCompressionResistancePriority(.defaultLow, for: .horizontal)
                        
                        UIView.spacer()
                        
                    }
                    .spacing(8)
                }
                .alignment(.leading)
                .spacing(5)
                .padding(insets: .init(all: 10))
                
                UIView.divider()
            }
        }
    }
    
    @discardableResult
    func configure(github: GithubModel) -> Self {
        fullNameLabel.text = github.fullName
        descriptionLabel.text = github.description
        starIconLabel.text = github.stargazersCount?.description ?? ""
        languageIconLabel.text = github.language ?? ""
        licenseLabel.text = github.license?.name ?? ""
        dateLabel.text = github.updatedAt?.description ?? ""
        
        return self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private static let mock: GithubSearchCollectionViewCell = .init(frame: .zero)
    static func size(width: CGFloat, github: GithubModel) -> CGSize {
        mock.frame.size.width = width
        mock.layoutIfNeeded()
        mock.configure(github: github)
        
        let size = mock.contentView.systemLayoutSizeFitting(
            UIView.layoutFittingCompressedSize,
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .fittingSizeLevel)
        return CGSize(width: width, height: ceil(size.height))
    }
    
}

import SwiftUI

private struct View_Wrapper: UIViewRepresentable {
    typealias View = GithubSearchCollectionViewCell
    func makeUIView(context: Context) -> View {
        return View.init(frame: .zero)
    }
    
    func updateUIView(_ cell: View, context: Context) {
        cell.configure(github: .sample)
    }
}

struct GithubSearchCollectionViewCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            View_Wrapper().previewLayout(.fixed(width: 400, height: 200))
        }
    }
}
