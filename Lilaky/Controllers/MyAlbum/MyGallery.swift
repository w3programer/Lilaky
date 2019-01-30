import UIKit
class MyGallery: UIViewController {
    @IBOutlet var GalleryCollectionView: UICollectionView!
    var  Gallery:MyAlbums?
    var Photoesarr = [MyPhotoes]()
    lazy var refresher:UIRefreshControl = {
        let refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(handelrefresh), for: .valueChanged)
        return refresher
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.title = NSLocalizedString("My photoes", comment: " photoes")
        view.backgroundColor = .white
        GalleryCollectionView.backgroundColor = .clear
        GalleryCollectionView.alwaysBounceVertical = true
        
        GalleryCollectionView.addSubview(refresher)
        GalleryCollectionView.dataSource = self
        //GalleryCollectionView.delegate = self
        handelrefresh()
    }
    @objc private func handelrefresh(){
        self.refresher.endRefreshing()
        
        Api.MyPhotos(Gallery?.album_id) { (error: Error?,Photoes:[MyPhotoes]?) in
            if let myphoto = Photoes {
                self.Photoesarr = myphoto
                self.GalleryCollectionView.reloadData()
            }
        }
        
        
   
    }
    
    
}

extension MyGallery: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Photoesarr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = GalleryCollectionView.dequeueReusableCell(withReuseIdentifier: "GalleryPhotoCell", for: indexPath)as? GalleryCell else{return UICollectionViewCell()}
       // let urlString = Urls.uploads+Photoesarr[indexPath.row].image
        //let url = URL(string: urlString )
       // cell.GalleryPhoto.downloadedFrom(url: url!)
        cell.photo = Photoesarr[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       // self.performSegue(withIdentifier: "MyAlbumSegue", sender: self)
    }
    
}
    

//extension MyGallery: UICollectionViewDelegateFlowLayout{
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let screenwidth = UIScreen.main.bounds.width
//        var width = (screenwidth-30)/2
//        width = width > 200 ? 200: width
//
//        return CGSize.init(width: width ,height:width)
//    }
//
//
//
//
//
//}
