//
//  ServiceManager.swift
//  CountryViewer
//
//  Created by Arturo Calvo on 9/18/19.
//  Copyright © 2019 Arturo Calvo. All rights reserved.
//

import Foundation
import Alamofire

class ServiceManager {
    static let sharedInstance = ServiceManager()
    func GetCountries(onSuccess:@escaping([CountryModel]?) -> Void){
        let urlString = "https://restcountries.eu/rest/v2/all"
        
        AF.request(urlString).responseDecodable(of: [CountryModel].self){response in
            onSuccess(response.value)
        }
    }
}
