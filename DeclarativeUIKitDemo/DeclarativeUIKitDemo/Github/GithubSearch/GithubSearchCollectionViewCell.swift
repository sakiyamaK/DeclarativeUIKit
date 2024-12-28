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
                        
        self.contentView.declarative(priorities: .init(bottom: .defaultLow)) {
            UIStackView.vertical {
                UIStackView.vertical {
                    UILabel(assign: &self.fullNameLabel)
                        .textAlignment(.left)
                        .font(UIFont.systemFont(ofSize: 28))
                        .contentHuggingPriority(.required, for: .vertical)
                        .contentCompressionResistancePriority(.required, for: .vertical)
                    
                    UILabel(assign: &self.descriptionLabel)
                        .textAlignment(.left)
                        .font(UIFont.systemFont(ofSize: 18))
                        .contentHuggingPriority(.required, for: .vertical)
                        .contentCompressionResistancePriority(.required, for: .vertical)
                    
                    UIStackView.horizontal {
                        UIStackView.horizontal {
                            UIImageView(
                                UIImage(systemName: "star")?.withRenderingMode(.alwaysTemplate).withTintColor(.black)
                            ).contentMode(.scaleAspectFit)
                            UILabel(assign: &self.starIconLabel)
                                .textAlignment(.left)
                                .font(UIFont.systemFont(ofSize: 15))
                                .contentHuggingPriority(.required, for: .vertical)
                                .contentCompressionResistancePriority(.required, for: .vertical)
                        }
                        .spacing(5)

                        UIStackView.horizontal {
                            UIImageView(
                                UIImage(systemName: "circle")?.withRenderingMode(.alwaysTemplate).withTintColor(.black)
                            ).contentMode(.scaleAspectFit)
                            UILabel(assign: &self.languageIconLabel)
                                .textAlignment(.left)
                                .font(UIFont.systemFont(ofSize: 15))
                                .contentHuggingPriority(.required, for: .vertical)
                                .contentCompressionResistancePriority(.required, for: .vertical)
                        }
                        .spacing(5)
                        
                        UILabel(assign: &self.licenseLabel)
                            .textAlignment(.left)
                            .font(UIFont.systemFont(ofSize: 15))
                            .contentHuggingPriority(.required, for: .vertical)
                            .contentCompressionResistancePriority(.required, for: .vertical)
                        
                        UILabel(assign: &self.dateLabel)
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

#Preview(traits: .fixedLayout(width: 400, height: 200)) {
    let cell = GithubSearchCollectionViewCell()
    cell.configure(github: .sample)
    return cell
}
