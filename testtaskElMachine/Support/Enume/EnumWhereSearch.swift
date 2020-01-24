//
//  EnumWhereSearch.swift
//  testtaskElMachine
//
//  Created by Nikitin Nikita on 24/01/2020.
//  Copyright © 2020 Zlobrynya. All rights reserved.
//

import Foundation

enum EnumWhereSearch{
    case name
    case description
    case readme
    
    func getReqvest() -> String{
        switch self {
        case .name:
            return Constant.server.search.byName
        case .description:
            return Constant.server.search.byDesc
        case .readme:
            return Constant.server.search.byReadme
        @unknown default:
            return ""
        }
    }
}
