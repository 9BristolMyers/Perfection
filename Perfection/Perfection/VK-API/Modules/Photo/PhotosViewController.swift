//
//  PhotosViewController.swift
//  Perfection
//
//  Created by Владимир Рузавин on 11/22/21.
//

import Foundation
import RealmSwift

class PhotosViewController: Object, UITableViewController {
    
    @objc dynamic var photos = PhotosAPI()
    @objc dynamic var photosDataBase = PhotosDataBase()
    @objc dynamic var friends: Results<PhotoModel>?
    @objc dynamic var token: NotificationToken?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        photosAPI.getPhotos { [weak self] photos in
            
            guard let self = self else { return }
            
            self.photosDataBase.save(photos)
            
            self.photos = self.photosDataBase.load()
                    
            self.token = self.photos?.observe { [weak self] changes in
                        guard let self = self else { return }
                
                switch changes {
                case .initial:
                    self.tableView.reloadData()
                            case .update(_, let deletions, let insertions, let modifications):
                    self.tableView.beginUpdates()
                    self.tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }), with: .automatic)
                    self.tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}), with: .automatic)
                    self.tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }), with: .automatic)
                    self.tableView.endUpdates()
                            case .error(let error):
                                fatalError("\(error)")
                }
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let photos = photos else { return 0 }
        return photos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let photo = photos?[indexPath.row]
        
        cell.textLabel?.text = photo.fullName
        
        if let imageURL = URL(string:photo.photo100 ?? "") {
            
            cell.imageView?.load(url: imageURL)
        }
        
        return cell
    }
}
