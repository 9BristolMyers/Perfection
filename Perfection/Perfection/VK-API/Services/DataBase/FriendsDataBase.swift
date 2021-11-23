//
//  FriendsDataBase.swift
//  Perfection
//
//  Created by Владимир Рузавин on 11/22/21.
//

import Foundation
import RealmSwift

/*protocol PersonDataBaseProtocol {
    
    func create(_ person: PersonModel)
    func read() -> [PersonModel]
    func delete(_ person: PersonModel)
}*/

final class FriendsDataBase {
    
    init() {
        
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 7)
    }

    func save(_ items: [FriendModel]) {
        let realm = try! Realm()
        
        try! realm.write {
            
            realm.add(items)
        }
    }
    
    func load() -> Results<FriendModel> {
        
        let realm = try! Realm()
        
        let friends: Results<FriendModel>
        
        return friends
    }
    
    func delete(_ item: FriendModel) {
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.delete(item)
        }
    }
}
