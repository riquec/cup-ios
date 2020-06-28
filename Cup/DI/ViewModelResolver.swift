//
//  ViewModelResolver.swift
//  Cup
//
//  Created by Henrique Jardim on 28/06/20.
//  Copyright © 2020 Jardim. All rights reserved.
//

import Foundation
import Resolver

extension Resolver {
    public static func registerViewModels() {
        register{ NicknameViewModel() }
    }
}
