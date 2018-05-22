
import UIKit

class MyAlbumVc: UIViewController {
    @IBOutlet var MyAlbumCollection: UICollectionView!
    var MyAlbum = [MyAlbums]()
    lazy var refresher:UIRefreshControl = {
        let refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(handelrefresh), for: .valueChanged)
        return refresher
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.title = NSLocalizedString("My albums", comment: "albums")
        view.backgroundColor = .white
        MyAlbumCollection.backgroundColor = .clear
        MyAlbumCollection.alwaysBounceVertical = true
      
        MyAlbumCollection.addSubview(refresher)
        MyAlbumCollection.dataSource = self
        MyAlbumCollection.delegate = self
        handelrefresh()
    }
    @objc private func handelrefresh(){
        self.refresher.endRefreshing()
        Api.Myalbums{(error: Error?,Albums:[MyAlbums]?)in
            if let myalbums = Albums {
                self.MyAlbum = myalbums
                self.MyAlbumCollection.reloadData()
            }
        }
    }
    
    
}

extension MyAlbumVc: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MyAlbum.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = MyAlbumCollection.dequeueReusableCell(withReuseIdentifier: "", for: indexPath)as? MyAlbumVCell else{return UICollectionViewCell()}
        cell.AlbumTitle.text = MyAlbum[indexPath.row].title
        let urlString = Urls.uploads+MyAlbum[indexPath.row].img
        let url = URL(string: urlString )
        cell.MyAlbumCover.downloadedFrom(url: url!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "MyAlbumSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? MyGallery {
            let indexpathes = self.MyAlbumCollection.indexPathsForSelectedItems
            let indexpath = indexpathes![0] as NSIndexPath
            let dataarr = self.MyAlbum[indexpath.row]
           destination.Gallery = dataarr
        }

        
    }
    
}
extension MyAlbumVc: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenwidth = UIScreen.main.bounds.width
        var width = (screenwidth-30)/2
        width = width > 200 ? 200: width
        
        return CGSize.init(width: width ,height:width)
    }
    
    
    
    
    
}
