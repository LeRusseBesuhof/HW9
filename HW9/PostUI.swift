import Foundation
import UIKit

final class PostUI {
    
    static func createImage(withCornerRadius rad: CGFloat = 0) -> UIImageView {
        {
            .config(view: $0) { img in
                img.layer.cornerRadius = rad
                img.clipsToBounds = true
                img.contentMode = .scaleAspectFill
            }
        }(UIImageView())
    }
    
    static func createLabel(fontSize size: CGFloat = 16, weight: UIFont.Weight = .regular, textColor: UIColor = .black) -> UILabel {
        {
            .config(view: $0) { label in
                label.font = UIFont.systemFont(ofSize: size, weight: weight)
                label.textAlignment = .left
                label.textColor = textColor
                label.numberOfLines = .zero
            }
        }(UILabel())
    }

}
