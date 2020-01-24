//
//  Constant.swift
//  testtaskElMachine
//
//  Created by Nikitin Nikita on 24/01/2020.
//  Copyright © 2020 Zlobrynya. All rights reserved.
//

import Foundation

class Constant{
    static let server = Server()
    
    struct Server {
        let url = "https://api.github.com/"
        let repos = ""
        let search = Search()
        
        struct Search {
            let urlSearch = "search/repositories"
            let mainParamet = "q"
            let byName = "in:name"
            let byDesc = "in:description"
            let byReadme = "in:readme"
            let byFollowers = "followers:"
            let byStars = "stars:"
            let byForks = "forks:"
            let byLanguage = "language:"
            let byLicense = "license:"
        }
        
    }
    
}
