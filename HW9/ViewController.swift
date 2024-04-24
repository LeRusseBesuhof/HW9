import UIKit

final class ViewController: UIViewController {

    private lazy var pageData = Post.mockData()
    
    private lazy var collectionView : UICollectionView = {
        let layout = $0.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = 0
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.sectionInset = UIEdgeInsets(top: .zero, left: 30, bottom: .zero, right: 30)
        
        $0.dataSource = self
        $0.register(PostCell.self, forCellWithReuseIdentifier: PostCell.reuseID)
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: UICollectionViewFlowLayout()))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(collectionView)
    }
}

extension ViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pageData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCell.reuseID, for: indexPath) as? PostCell else { return UICollectionViewCell() }
        
        cell.setCell(pageData[indexPath.item])
        return cell
    }
}
