import UIKit
import Photos
import BSImagePicker
class UploadPhotoVC: UIViewController {
    var SelectedAssets = [PHAsset]()
    var PhotoArray = [UIImage]()
    var strimagearr = [String]()
    var albumid = 0
    var imagecount = 0
    fileprivate let cellidentifier = "UploadCVCell"
    @IBOutlet var UploadcolectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        PhotoArray.reserveCapacity(imagecount)
        navigationController?.title = NSLocalizedString("select albums photoes", comment: "select photoes")
        view.backgroundColor = .white
        
        
        
        
        UploadcolectionView.backgroundColor = .clear
        UploadcolectionView.alwaysBounceVertical = true
      
        let cellsize = CGSize(width: 175, height: 175)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = cellsize
        layout.sectionInset = UIEdgeInsets(top: 1, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0.5
        layout.minimumInteritemSpacing = 0.5
        UploadcolectionView.setCollectionViewLayout(layout, animated: true)
    UploadcolectionView.register(UINib.init(nibName:cellidentifier,bundle:nil), forCellWithReuseIdentifier: cellidentifier)

        UploadcolectionView.dataSource = self
        UploadcolectionView.delegate = self

       UploadcolectionView.reloadData()
    }
    @IBAction func SelectPhotoes(_ sender: UIBarButtonItem) {
        let vc = BSImagePickerViewController()
        vc.maxNumberOfSelections = imagecount-PhotoArray.count
        //display picture gallery
        self.bs_presentImagePickerController(vc, animated: true,
                                             select: { (asset: PHAsset) -> Void in
                                                
        }, deselect: { (asset: PHAsset) -> Void in
            // User deselected an assets.
            
        }, cancel: { (assets: [PHAsset]) -> Void in
            // User cancelled. And this where the assets currently selected.
        }, finish: { (assets: [PHAsset]) -> Void in
            // User finished with these assets
            for i in 0..<assets.count
            {
                self.SelectedAssets.append(assets[i])
                
            }
            
            self.convertAssetToImages()
            
        }, completion: nil)

    }
    
    
    func convertAssetToImages() -> Void {
        
        if SelectedAssets.count != 0{
            for i in 0..<SelectedAssets.count{
                let manager = PHImageManager.default()
                let option = PHImageRequestOptions()
                var thumbnail = UIImage()
                option.isSynchronous = true
                manager.requestImage(for: SelectedAssets[i], targetSize: CGSize(width: 200, height: 200), contentMode: .aspectFit, options: option, resultHandler: {(result, info)->Void in
                    thumbnail = result!
                    
                })

                let data = UIImageJPEGRepresentation(thumbnail, 0.7)
                let newImage = UIImage(data: data!)
                self.PhotoArray.append(newImage! as UIImage)
                
                self.strimagearr.append((newImage?.encodeimage(format: ImageFormat.JPEG(0)))!)
            }
            //self.imgView.animationImages = self.PhotoArray
           // self.imgView.animationDuration = 3.0
           // self.imgView.startAnimating()
   
        }
        DispatchQueue.main.async {
            self.UploadcolectionView.reloadData()

        }
        // print(self.strimagearr)
        //print("complete photo array \(self.PhotoArray.capacity)")
    }

    @IBAction func UploadPhotoes(_ sender: UIBarButtonItem) {
       
        
        if PhotoArray.count < imagecount {
            let title:String = NSLocalizedString("alert", comment: "")
            let message:String = NSLocalizedString("you should select all album photo first", comment: "")
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            self.present(alert,animated: true)
            
        }else{
            let alert = UIAlertController(title: nil, message: NSLocalizedString("Please wait...", comment: "spinner"), preferredStyle: .alert)
            
            let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
            loadingIndicator.hidesWhenStopped = true
            loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
            loadingIndicator.startAnimating();
            
            alert.view.addSubview(loadingIndicator)
            present(alert, animated: true, completion: nil)
            
            
            Api.uploadimages(requestedfile: strimagearr, useridfk: Helper.getuserid(), offer_id: albumid) { (error:Error?, success :Bool) in
                if success {
                }else{
                    print(error as Any)
                }
                self.dismiss(animated: false, completion: nil)
                
                let title:String = NSLocalizedString("report", comment: "")
                let message:String = NSLocalizedString("uploaded successfuly", comment: "")
                let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
                self.present(alert,animated: true)
                
            }
        }
        
 
        
        
        
        
    }
}
extension UploadPhotoVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagecount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let cell = UploadcolectionView.dequeueReusableCell(withReuseIdentifier: cellidentifier, for: indexPath)as? UploadCVCell else {return UICollectionViewCell()}

         cell.PhotoofCell.image = #imageLiteral(resourceName: "Placeholder")
        if PhotoArray.count != 0{
            cell.PhotoofCell.image = PhotoArray[indexPath.row]
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }

    }


extension UploadPhotoVC: UICollectionViewDelegateFlowLayout{
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
////        let screenwidth = UIScreen.main.bounds.width
////        var width = (screenwidth-30)/2
////        width = width > 200 ? 200: width
////
////        return CGSize.init(width: width ,height:width)
//}
}
