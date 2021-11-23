//
//  PhotosAPI.swift
//  Perfection
//
//  Created by Владимир Рузавин on 11/22/21.
//

import Foundation
import Alamofire
import SwiftyJSON

final class PhotosAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let userId = Session.shared.userId
    let version = "5.81"
    
    func getPhotos(completion: @escaping([PhotoModel])->()) {
        
        let method = "/photos.getAll"
        
        let parameters: Parameters = [
            "owner_id": userId,
            "extended": 1,
            "no_service_album": 0,
            "order": "name",
            "access_token": token,
            "count": 10,
            "v": version
        ]
        
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            
            guard let data = response.data else { return }
            
            debugPrint(data.prettyJSON ?? "")
            
            do {
                let itemsData = try JSON(data)["response"]["items"].rawData()
                var photos = try JSONDecoder().decode([PhotoModel].self, from: itemsData)
                
                for photo in photos {
                    photo.assetUrl = photo.photoUrl
                }
                
                completion(photos)
                
            } catch {
                print(error)
            }
        }
    }
}
