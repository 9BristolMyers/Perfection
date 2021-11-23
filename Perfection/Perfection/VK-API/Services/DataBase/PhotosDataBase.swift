//
//  PhotosDataBase.swift
//  Perfection
//
//  Created by Владимир Рузавин on 11/23/21.
//

import Foundation
import RealmSwift

final class PhotosDataBase {
    
    init() {
        
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 7)
    }

    func add(_ items: [PhotoModel]) {
        let realm = try! Realm()
        
        try! realm.write {
            
            realm.add(items)
        }
    }
    
    func load() -> Results<PhotoModel> {
        
        let realm = try! Realm()
        
        let photos: Results<PhotoModel>
        
        return photos
    }
    
    func delete(_ item: PhotoModel) {
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.delete(item)
        }
    }
    
    func deleteAll() {
        let realm = try! Realm()
        
        try! realm.write {
            realm.deleteAll()
        }
    }
}
