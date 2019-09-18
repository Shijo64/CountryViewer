//
//  RegionalBlocModel.swift
//  CountryViewer
//
//  Created by Arturo Calvo on 9/18/19.
//  Copyright © 2019 Arturo Calvo. All rights reserved.
//

import Foundation

struct RegionalBlocModel:Codable {
    var acronym:String?
    var name:String?
    var otherAcronyms:[String]?
    var otherNames:[String]?
}
