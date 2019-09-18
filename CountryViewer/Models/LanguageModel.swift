//
//  LanguageModel.swift
//  CountryViewer
//
//  Created by Arturo Calvo on 9/18/19.
//  Copyright © 2019 Arturo Calvo. All rights reserved.
//

import Foundation

struct LanguageModel:Codable {
    var iso639_1:String?
    var iso639_2:String?
    var name:String?
    var nativeName:String?
}
