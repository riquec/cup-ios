//
//  RepositoryModule.swift
//  Cup
//
//  Created by Henrique Jardim on 04/07/20.
//  Copyright © 2020 Jardim. All rights reserved.
//

import Foundation
import DIKit

public extension DependencyContainer {
    static var repostiory = module {
        single { UserRepositoryDefault() as UserRespository }
    }
}
