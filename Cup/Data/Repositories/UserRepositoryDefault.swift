//
//  UserRepositoryDefault.swift
//  Cup
//
//  Created by Henrique Jardim on 27/06/20.
//  Copyright © 2020 Jardim. All rights reserved.
//

import Foundation

class UserRepositoryDefault : UserRespository {
    func saveNickname(nickname: String) {
        DispatchQueue.global(qos: .background).async {
            UserDefaults.standard.set(nickname, forKey: Constants.UserDefault.NICKNAME_KEY)
        }
    }
}
