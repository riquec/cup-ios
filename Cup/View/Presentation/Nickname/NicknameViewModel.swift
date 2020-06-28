//
//  NicknameViewModel.swift
//  Cup
//
//  Created by Henrique Jardim on 27/06/20.
//  Copyright © 2020 Jardim. All rights reserved.
//

import Foundation
import Bond
import Resolver

class NicknameViewModel {
    fileprivate let repository : UserRespository = Resolver.resolve()
    
    func saveNickname(nickname: String){
        print("save nickname in viewmodel called")
        repository.saveNickname(nickname: nickname)
        
    }
}
