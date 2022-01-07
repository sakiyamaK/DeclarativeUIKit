import Foundation

import UIKit
import DeclarativeUIKit

final class GithubSearchCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier: String = "GithubSearchCollectionViewCell"
    
    private enum ViewTag: Int {
        case fullNameLabel = 1
        case descriptionLabel
        case starIconLbel
        case languageIconLbel
        case licenseLabel
        case dateLabel
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let BottomIconView = { (iconName: String, tagId: Int) -> UIView in
            UIStackView.horizontal {
                UIImageView(
                    UIImage(systemName: iconName)?.withRenderingMode(.alwaysTemplate).withTintColor(.black)
                ).contentMode(.scaleAspectFit)
                UILabel(tag: tagId)
                    .textAlignment(.left)
                    .font(UIFont.systemFont(ofSize: 20))
                    .contentHuggingPriority(.required, for: .vertical)
                    .contentCompressionResistancePriority(.required, for: .vertical)
            }
            .spacing(5)
        }
        
        self.contentView.declarative(priorities: .init(bottom: .defaultLow)) {
            UIStackView {
                UIStackView {
                    UILabel(tag: ViewTag.fullNameLabel.rawValue)
                        .textAlignment(.left)
                        .font(UIFont.systemFont(ofSize: 30))
                        .contentHuggingPriority(.required, for: .vertical)
                        .contentCompressionResistancePriority(.required, for: .vertical)

                    UILabel(tag: ViewTag.descriptionLabel.rawValue)
                        .textAlignment(.left)
                        .font(UIFont.systemFont(ofSize: 20))
                        .contentHuggingPriority(.required, for: .vertical)
                        .contentCompressionResistancePriority(.required, for: .vertical)
                    
                    UIStackView.horizontal {
                        BottomIconView("circle", ViewTag.starIconLbel.rawValue)
                        
                        BottomIconView("circle", ViewTag.languageIconLbel.rawValue)
                        
                        UILabel(tag: ViewTag.licenseLabel.rawValue)
                            .textAlignment(.left)
                            .font(UIFont.systemFont(ofSize: 20))
                            .contentHuggingPriority(.required, for: .vertical)
                            .contentCompressionResistancePriority(.required, for: .vertical)

                        UILabel(tag: ViewTag.dateLabel.rawValue)
                            .textAlignment(.left)
                            .font(UIFont.systemFont(ofSize: 20))
                            .contentHuggingPriority(.required, for: .vertical)
                            .contentCompressionResistancePriority(.required, for: .vertical)
                        
                        UIView.spacer()
                        
                    }
                    .spacing(10)
                }
                .alignment(.leading)
                .spacing(20)
                .padding(insets: .init(top: 20, left: 10, bottom: 20, right: 10))
                
                UIView.divider()
            }
        }
    }
    
    @discardableResult
    func configure(github: GithubModel) -> Self {
        guard
            let fullNameLabel = self.viewWithTag(ViewTag.fullNameLabel.rawValue) as? UILabel,
            let descriptionLabel = self.viewWithTag(ViewTag.descriptionLabel.rawValue) as? UILabel,
            let starIconLabel = self.viewWithTag(ViewTag.starIconLbel.rawValue) as? UILabel,
            let languageLabel = self.viewWithTag(ViewTag.languageIconLbel.rawValue) as? UILabel,
            let licenseLabel = self.viewWithTag(ViewTag.licenseLabel.rawValue) as? UILabel,
            let dateLabel = self.viewWithTag(ViewTag.dateLabel.rawValue) as? UILabel
        else {
            return self
        }
        
        fullNameLabel.text = github.fullName
        descriptionLabel.text = github.description
        starIconLabel.text = github.stargazersCount?.description ?? ""
        languageLabel.text = github.language ?? ""
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
