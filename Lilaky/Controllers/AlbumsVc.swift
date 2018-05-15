import UIKit
class AlbumsVc: UIViewController {
 fileprivate let cellidentifier = "PhotoCell"
    @IBOutlet var colectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
            colectionView.backgroundColor = .clear
            colectionView.alwaysBounceVertical = true
        colectionView.register(UINib.init(nibName:cellidentifier,bundle:nil), forCellWithReuseIdentifier: cellidentifier)
        
        colectionView.dataSource = self
        colectionView.delegate = self
        
        
    }

   
    
    
}

extension AlbumsVc: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = colectionView.dequeueReusableCell(withReuseIdentifier: cellidentifier, for: indexPath)as? PhotoCell else{return UICollectionViewCell()}
        cell.AlbumCover.image = #imageLiteral(resourceName: "Placeholder")
        cell.AlbumeTitle.text = "lilaky album"
        return cell
    }
}
extension AlbumsVc: UICollectionViewDelegateFlowLayout{
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenwidth = UIScreen.main.bounds.width
        let width = (screenwidth-30)/2
        
        
        return CGSize.init(width: width ,height:width)
    }
    
}

