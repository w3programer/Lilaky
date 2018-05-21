import UIKit
class AlbumsVc: UIViewController {
    var Offers = [OffersKeys]()
    lazy var refresher:UIRefreshControl = {
        let refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(handelrefresh), for: .valueChanged)
        return refresher
    }()
    
    fileprivate let cellidentifier = "PhotoCell"
    @IBOutlet var colectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.title = NSLocalizedString("albums", comment: "albums")
        view.backgroundColor = .white
            colectionView.backgroundColor = .clear
            colectionView.alwaysBounceVertical = true
            colectionView.register(UINib.init(nibName:cellidentifier,bundle:nil), forCellWithReuseIdentifier: cellidentifier)
            colectionView.addSubview(refresher)
            colectionView.dataSource = self
            colectionView.delegate = self
            handelrefresh()
    }
   @objc private func handelrefresh(){
    self.refresher.endRefreshing()
        Api.offers{(error: Error?,Offers:[OffersKeys]?)in
            if let offersvalue = Offers {
                self.Offers = offersvalue
                self.colectionView.reloadData()

            }
        }
    }
 
    
}

extension AlbumsVc: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Offers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = colectionView.dequeueReusableCell(withReuseIdentifier: cellidentifier, for: indexPath)as? PhotoCell else{return UICollectionViewCell()}
        let urlString = Urls.uploads+Offers[indexPath.row].img
        let url = URL(string: urlString )
        cell.AlbumCover.downloadedFrom(url: url!)

       // cell.AlbumCover.image = Offers[indexPath.row].img
        cell.AlbumeTitle.text = Offers[indexPath.row].title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "OfferDetailesSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? OffersDetailes {
            let indexpathes = self.colectionView.indexPathsForSelectedItems
            let indexpath = indexpathes![0] as NSIndexPath
            let dataarr = self.Offers[indexpath.row]
            destination.offerDescription = dataarr  
        }
        
        
        
    }

}
extension AlbumsVc: UICollectionViewDelegateFlowLayout{
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenwidth = UIScreen.main.bounds.width
        var width = (screenwidth-30)/2
        width = width > 200 ? 200: width
        
        return CGSize.init(width: width ,height:width)
    }
    
}

