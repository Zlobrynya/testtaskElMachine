//
//  ServerModel.swift
//  testtaskElMachine
//
//  Created by Nikitin Nikita on 24/01/2020.
//  Copyright © 2020 Zlobrynya. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import SwiftyJSON

class ServerModel{
    
    class func getSimpleSearch(search: String) -> Observable<[ModelSearch]>{
        let parameters = [Constant.server.search.mainParamet : search]
        let url = Constant.server.url + Constant.server.search.urlSearch
        return sendRequvest(url: url, parameters: parameters)
    }
    
    class func getExtendedSearch(search: String,
                                 where: EnumWhereSearch? = nil,
                                 followers: NumberAndComparisons? = nil,
                                 forks: NumberAndComparisons? = nil,
                                 starts: NumberAndComparisons? = nil,
                                 language: String? = nil,
                                 license: EnumLicense? = nil) -> Observable<[ModelSearch]>  {
        let url = Constant.server.url + Constant.server.search.urlSearch
        let parameters = [Constant.server.search.mainParamet : search]
        return sendRequvest(url: url, parameters: parameters)
    }
    
    private class func sendRequvest(url: String, parameters: [String: Any]) -> Observable<[ModelSearch]>{
        return Observable<[ModelSearch]>.create({ observer in
            var listModels = [ModelSearch]()
            Alamofire.request(url, method: .get, parameters: parameters)
                .validate()
                .response{ response in
                    if let error = response.error{
                        observer.onError(error)
                        return observer.onCompleted()
                    }
                    if let responseData = response.data {
                        do {
                            let json = try JSON(data: responseData)
                            let items = json["items"]
                            for item in items{
                                let model = ModelSearch()
                                model.desk = item.1["description"].stringValue
                                model.id = item.1["id"].int ?? 0
                                model.language = item.1["language"].stringValue
                                model.name = item.1["name"].stringValue
                                listModels.append(model)
                            }
                            observer.onNext(listModels)
                            observer.onCompleted()
                        }catch{
                            observer.onError(error)
                            observer.onCompleted()
                        }

                    }else{
                        observer.onError(NSError(domain:"", code: 400, userInfo:nil))
                        return observer.onCompleted()
                    }
            }
            return Disposables.create()
        })
    }
    
}
