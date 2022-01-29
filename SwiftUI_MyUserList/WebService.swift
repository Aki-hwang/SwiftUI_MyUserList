//
//  WebService.swift
//  SwiftUI_MyUserList
//
//  Created by Chuljin Hwang on 2022/01/29.
//

import Foundation
import SwiftUI

struct User: Codable, Identifiable{
    var id : String
    var name : String
    var avata : String
    var createdAt : String
}

class WevService{
    func loadUsers(completion: @escaping ([User]) -> Void){
        guard let url = URL(string: "https://61f4a86210f0f7001768c996.mockapi.io/user") else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let hasData = data else {
                return
            }
            let users = try! JSONDecoder().decode([User].self, from: hasData)
            completion(users)
        }.resume()
    }
}
