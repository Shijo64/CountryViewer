//
//  CountryModel.swift
//  CountryViewer
//
//  Created by Arturo Calvo on 9/18/19.
//  Copyright © 2019 Arturo Calvo. All rights reserved.
//

import Foundation

struct CountryModel: Codable {
    var name:String?
    var topLevelDomain:[String]?
    var alpha2Code:String?
    var alpha3Code:String?
    var callingCodes:[String]?
    var capital:String?
    var altSpellings:[String]?
    var region:String?
    var subregion:String?
    var population:Int?
    var latlng:[Double]?
    var demonym:String?
    var area:Double?
    var gini:Double?
    var timezones:[String]?
    var borders:[String]?
    var nativeName:String?
    var numericCode:String?
    var currencies:[CurrencyModel]?
    var languages:[LanguageModel]?
    var translations:TranslationModel?
    var flag:URL?
    var regionalBlocs:[RegionalBlocModel]?
    var cioc:String?
}
