//
//  PhotosCollectionController.swift
//  Perfection
//
//  Created by Владимир Рузавин on 11/22/21.
//

import UIKit
import RealmSwift

private let reuseIdentifier = "PhotoCell"

final class PhotosCollectionController: UICollectionViewController {
    
    private var photos: Results<PhotoModel>?
    private let photosAPI = PhotosAPI()
    private let photoDataBase = PhotosDataBase()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        photosAPI.getPhotos { [weak self] photos in
            guard let self = self else { return }
            
            self.photoDataBase.deleteAll()
            self.photoDataBase.add(photos)
            self.photos = self.photoDataBase.load()
            self.collectionView.reloadData()
            
           
        }

    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let photos = photos else { return 0 }
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoCell
    
        let photo = photos?[indexPath.row]
        
        if let photoURL = URL(string: photo?.photoUrl ?? "") {
            
            cell.imageView.load(url: photoURL)
        }
        
        return cell
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemsInRow: CGFloat = 2
        let offSetOfWidth = 20 * (itemsInRow + 1)
        let availableWidth = collectionView.frame.width - offSetOfWidth
        let widthForItem = availableWidth / itemsInRow
        return CGSize(width: widthForItem, height: widthForItem)
        
        //return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
}
