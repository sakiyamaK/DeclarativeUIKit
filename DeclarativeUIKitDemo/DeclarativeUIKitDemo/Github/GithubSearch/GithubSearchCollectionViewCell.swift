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
                UIImageView {
                    guard let imageView = $0 as? UIImageView else { return }
                    imageView.image = UIImage(systemName: iconName)?.withRenderingMode(.alwaysTemplate).withTintColor(.black)
                }
                .contentMode(.scaleAspectFit)
                UILabel {
                    guard let label = $0 as? UILabel else { return }
                    label.textAlignment = .left
                    label.font = UIFont.systemFont(ofSize: 20)
                    label.setContentHuggingPriority(.required, for: .vertical)
                    label.setContentCompressionResistancePriority(.required, for: .vertical)
                }.tag(tagId)
            }
            .spacing(5)
        }
        
        self.contentView.declarate(priorities: .init(bottom: .defaultLow) ) {
            UIStackView.vertical {
                UIView.spacer().height(20)
                UIStackView.horizontal {
                    UIView.spacer().width(10)
                    
                    UIStackView.vertical {
                        UIImageView {
                            guard let imageView = $0 as? UIImageView else { return }
                            imageView.image = UIImage(systemName: "book.closed")?.withRenderingMode(.alwaysTemplate).withTintColor(.black)
                        }
                        .width(20)
                        .aspectRatio(1.0)
                        
                        UIView.spacer()
                    }.isHidden(true)
                    
                    UIStackView.vertical {
                        UILabel {
                            guard let label = $0 as? UILabel else { return }
                            label.textAlignment = .left
                            label.font = UIFont.systemFont(ofSize: 30)
                            label.setContentHuggingPriority(.required, for: .vertical)
                            label.setContentCompressionResistancePriority(.required, for: .vertical)
                        }.tag(ViewTag.fullNameLabel.rawValue)
                        
                        UILabel {
                            guard let label = $0 as? UILabel else { return }
                            label.textAlignment = .left
                            label.font = UIFont.systemFont(ofSize: 20)
                            label.setContentHuggingPriority(.required, for: .vertical)
                            label.setContentCompressionResistancePriority(.required, for: .vertical)
                        }.tag(ViewTag.descriptionLabel.rawValue)
                        
                        UIStackView.horizontal {
                            BottomIconView("circle", ViewTag.starIconLbel.rawValue)
                            
                            BottomIconView("circle", ViewTag.languageIconLbel.rawValue)
                            
                            UILabel {
                                guard let label = $0 as? UILabel else { return }
                                label.textAlignment = .left
                                label.font = UIFont.systemFont(ofSize: 20)
                                label.setContentHuggingPriority(.required, for: .vertical)
                                label.setContentCompressionResistancePriority(.required, for: .vertical)
                            }.tag(ViewTag.licenseLabel.rawValue)
                            
                            UILabel {
                                guard let label = $0 as? UILabel else { return }
                                label.textAlignment = .left
                                label.font = UIFont.systemFont(ofSize: 20)
                                label.setContentHuggingPriority(.required, for: .vertical)
                                label.setContentCompressionResistancePriority(.required, for: .vertical)
                            }.tag(ViewTag.dateLabel.rawValue)
                            
                            UIView.spacer()
                            
                        }
                        .spacing(10)
                    }
                    .spacing(20)
                }
                .spacing(10)
                
                UIView.spacer().height(20)
                UIView.spacer().height(2).backgroundColor(.systemGray)
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
