//
//  Dependencies.swift
//  Cup
//
//  Created by Henrique Jardim on 28/06/20.
//  Copyright © 2020 Jardim. All rights reserved.
//
import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        registerViewModels()
        registerRepositories()
    }
}
