import UIKit

protocol ReuseIDCellProtocol : AnyObject {
    static var reuseID : String { get }
}

final class PostCell: UICollectionViewCell, ReuseIDCellProtocol {
    
    internal static let reuseID : String = "Post"
    
    private let viewWidth : CGFloat = UIScreen.main.bounds.width
    
    private lazy var canvas : UIView = {
        {
            .config(view: $0) { view in
                view.backgroundColor = .appLightGray
            }
        }(UIView())
    }()
    
    private lazy var profilePicture : UIImageView = PostUI.createImage(withCornerRadius: 22)
    
    private lazy var userName : UILabel = PostUI.createLabel(fontSize: 20, weight: .semibold)
    
    private lazy var mainImage : UIImageView = PostUI.createImage()
    
    private lazy var postDate : UILabel = PostUI.createLabel(fontSize: 14, textColor: .gray)
    
    private lazy var header : UILabel = PostUI.createLabel(fontSize: 22, weight: .bold)
    
    private lazy var text : UILabel = PostUI.createLabel()
    
    override func prepareForReuse() { mainImage.image = nil }
    
    func setCell(_ post: Post) -> Void {
        
        profilePicture.image = UIImage(named: post.profilePicture)
        userName.text = post.userName
        mainImage.image = UIImage(named: post.mainImage)
        postDate.text = post.date
        header.text = post.header
        text.text = post.text
        
        [profilePicture, userName, mainImage, postDate, header, text].forEach {
            canvas.addSubview($0)
        }
        
        addSubview(canvas)
        
        activateConstraints()
    }
    
    private func activateConstraints() -> Void {
        NSLayoutConstraint.activate([
            
            canvas.leadingAnchor.constraint(equalTo: leadingAnchor),
            canvas.topAnchor.constraint(equalTo: topAnchor),
            canvas.trailingAnchor.constraint(equalTo: trailingAnchor),
            canvas.widthAnchor.constraint(equalToConstant: viewWidth - 60),
            canvas.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            profilePicture.leadingAnchor.constraint(equalTo: canvas.leadingAnchor, constant: 20),
            profilePicture.topAnchor.constraint(equalTo: canvas.topAnchor, constant: 20),
            profilePicture.widthAnchor.constraint(equalToConstant: 44),
            profilePicture.heightAnchor.constraint(equalToConstant: 44),
            
            userName.leadingAnchor.constraint(equalTo: profilePicture.trailingAnchor, constant: 20),
            userName.topAnchor.constraint(equalTo: canvas.topAnchor, constant: 30),
            userName.trailingAnchor.constraint(equalTo: canvas.trailingAnchor, constant: -20),
            
            mainImage.leadingAnchor.constraint(equalTo: canvas.leadingAnchor, constant: 20),
            mainImage.topAnchor.constraint(equalTo: profilePicture.bottomAnchor, constant: 20),
            mainImage.widthAnchor.constraint(equalToConstant: viewWidth - 100),
            mainImage.heightAnchor.constraint(equalTo: mainImage.widthAnchor, multiplier: mainImage.image?.getRatio() ?? 1),
            
            postDate.leadingAnchor.constraint(equalTo: mainImage.leadingAnchor),
            postDate.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 9),
            postDate.widthAnchor.constraint(equalTo: mainImage.widthAnchor),
            
            header.leadingAnchor.constraint(equalTo: postDate.leadingAnchor),
            header.topAnchor.constraint(equalTo: postDate.bottomAnchor, constant: 4),
            header.widthAnchor.constraint(equalTo: postDate.widthAnchor),
            
            text.leadingAnchor.constraint(equalTo: header.leadingAnchor),
            text.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 10),
            text.widthAnchor.constraint(equalTo: header.widthAnchor),
            text.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
}
