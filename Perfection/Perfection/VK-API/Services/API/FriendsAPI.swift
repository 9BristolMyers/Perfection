//
//  FriendsAPI.swift
//  Perfection
//
//  Created by Владимир Рузавин on 11/22/21.
//

import Foundation
import Alamofire
import SwiftyJSON


final class FriendsAPI {
        
        let baseUrl = "https://api.vk.com/method"
        let token = Session.shared.token
        let userId = Session.shared.userId
        let version = "5.81"
        
        func getFriends3(completion: @escaping([FriendModel])->()) {
            
            let method = "/friends.get"
            
            let parameters: Parameters = [
                "user_id": userId,
                "order": "name",
                "access_token": token,
                "fields": "photo_50, photo_100",
                "count": 10,
                "v": version
            ]
            
            let url = baseUrl + method
            
            AF.request(url, method: .get, parameters: parameters).responseJSON { response in
                
                guard let data = response.data else { return }
                debugPrint(response.data?.prettyJSON as Any)
                
                do {
                    let itemsData = try JSON(data)["response"]["items"].rawData()
                    let friends = try JSONDecoder().decode([FriendModel]).self, from: itemsData
                    
                    completion(friends)
                    
                } catch {
                    print("error")
                }
            }
        }
    
    func getFriends2(completion: @escaping([Friend2])->()) {
        
        let method = "/friends.get"
        
        let parameters: Parameters = [
            "user_id": userId,
            "order": "name",
            "access_token": token,
            "fields": "photo_50, photo_100",
            "count": 10,
            "v": version
        ]
        
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            
            guard let data = response.data else { return }
            debugPrint(response.data?.prettyJSON as Any)
            
            do {
                
                let friendsJSON = try? JSONDecoder().decode(FriendsJSON.self, from: data)
                let friends: [Friend2] = friendsJSON?.response.items ?? []
                completion(friends)
                
            } catch {
                print("error")
            }
        }
    }
        
//SwiftyJSON
struct Friend2 {
    
    var id: Int = 0
    var firstName: String = ""
    var lastName: String = ""
    var photo100: String = ""
    
    var fullName: String {
        firstName + lastName
    }
    
    init(json: JSON) {
        self.id = json["id"].intValue
        self.firstName = json["first_name"].string
        self.lastName = json["last_name"].string
        self.photo100 = json["photo_100"].string
    }
}


//JSONSerialization
struct Friend1 {
    
    var id: Int = 0
    var firstName: String?
    var lastName: String?
    var photo100: String?
    
    var fullName: String {
        
        (firstName ?? "") + (lastName ?? "")
    }
    
    init(item: [String: Any]) {
        self.id = item["id"] as! Int
        self.firstName = item["first_name"] as? String
        self.lastName = item["last_name"] as? String
        self.photo100 = item["photo_100"] as? String
    }
    
}
    
    struct Friend3 {
        
        var id: Int = 0
        var firstName: String = ""
        var lastName: String = ""
        var photo100: String = ""
        
        var fullName: String {
            firstName + lastName
        }
        
        init(json: JSON) {
            self.id = json["id"].intValue
            self.firstName = json["first_name"].string
            self.lastName = json["last_name"].string
            self.photo100 = json["photo_100"].string
        }
    }
    
    struct Friend4 {
        
        var id: Int = 0
        var firstName: String = ""
        var lastName: String = ""
        var photo100: String = ""
        
        var fullName: String {
            firstName + lastName
        }
        
        init(json: JSON) {
            self.id = json["id"].intValue
            self.firstName = json["first_name"].string
            self.lastName = json["last_name"].string
            self.photo100 = json["photo_100"].string
        }
    }

   
    func getFriends(completion: @escaping([Friend1])->()) {
        
        let method = "/friends.get"
        
        let parameters: Parameters = [
            "user_id": userId,
            "order": "name",
            "access_token": token,
            "fields": "photo_50, photo_100",
            "count": 10,
            "v": version
        ]
        
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            
            guard let data = response.data else { return }
            debugPrint(response.data?.prettyJSON)
            
            do {
                
                guard let items = JSON(data)["response"]["items"].array else { return }
                
                let friends = items.map { Friend1(json: $0) }
                
                completion(friends)
                
            } catch {
                print("error")
            }
        }
    }
    
    
    func getFriends4(completion: @escaping([FriendDataBase])->()) {
        
        let method = "/friends.get"
        
        let parameters: Parameters = [
            "user_id": userId,
            "order": "name",
            "access_token": token,
            "fields": "photo_50, photo_100",
            "count": 10,
            "v": version
        ]
        
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            
            guard let data = response.data else { return }
            debugPrint(response.data?.prettyJSON as Any)
            
            do {
                
                let friendsJSON = try? JSONDecoder().decode(FriendsJSON.self, from: data)
                let friends: [FriendDataBase] = friendsJSON?.response.items ?? []
                completion(friends)
                
            } catch {
                print("error")
            }
        }
    }
}
