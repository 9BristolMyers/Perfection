//
//  RealmViewController.swift
//  Perfection
//
//  Created by Владимир Рузавин on 11/22/21.
//

import UIKit
import RealmSwift

class RealmViewController: UIViewController {
    
    let friendDataBase = FriendsDataBase()
    
    var friends: [FriendsDataBase] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let friend = FriendModel()
        friend.lastName = "Deleted 4"
        friend.id = 14
        friendDataBase.load(friend)
        
        friendDataBase.save(friend)
        
        friendDataBase.delete(friend)
        
        /* person.pet = "Vanessa"
         
        let migration = Realm.configuration(schemaVersion: 3)
        let mainRealm = try! Realm(configuration: migration)
        mainRealm.add(person)
        
        mainRealm.beginWrite()
        mainRealm.add(person)
        try! mainRealm.commitWrite()
        
        print(mainRealm.confirmation.fileURL ?? "")
        
        let persons = mainRealm.objects(PersonModel.self)
        persons.forEach { print($0.name, $0.age, $0.pet) }
        print(mainRealm.confirmation.fileURL ?? "")
        return Array(users)
        
        mainRealm.beginWrite()
        mainRealm.delete(person)
        try! mainRealm.commitWrite()
    }*/
    }
}
