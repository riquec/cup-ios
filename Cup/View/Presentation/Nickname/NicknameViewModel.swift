//
//  NicknameViewModel.swift
//  Cup
//
//  Created by Henrique Jardim on 27/06/20.
//  Copyright © 2020 Jardim. All rights reserved.
//

import Foundation
import DIKit
import Observable

class NicknameViewModel {
    var coordinator: NicknameCoordinator?
    
    var shouldDisplayErrorObservable : Observable<Bool> {
        return shouldDisplayError
    }
    
    var shouldNavigateToCategoryObservable : Observable<Bool> {
        return shouldNavigateToCategory
    }
    
    
    fileprivate let shouldDisplayError = MutableObservable<Bool>(false)
    fileprivate let shouldNavigateToCategory = MutableObservable<Bool>(false)
    
    fileprivate let repository : UserRespository
    
    init(repository: UserRespository = resolve()) {
        self.repository = repository
    }
    
    func validateAndSaveNickname(nickname: String?){
        if isValidNickname(nickname : nickname) {
//            repository.saveNickname(nickname: nickname!)
//            shouldNavigateToCategory.wrappedValue = true
            coordinator?.goToCategory()
        } else {
            shouldDisplayError.wrappedValue = true
        }
    }
    
    fileprivate func isValidNickname(nickname : String?) -> Bool {
        return !(nickname?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? false)
    }
}
