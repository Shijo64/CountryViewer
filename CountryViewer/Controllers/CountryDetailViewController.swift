//
//  CountryDetailViewController.swift
//  CountryViewer
//
//  Created by Arturo Calvo on 9/23/19.
//  Copyright © 2019 Arturo Calvo. All rights reserved.
//

import UIKit
import WebKit
import ShadowView

class CountryDetailViewController: UIViewController {

    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var countryFlagWebView: WKWebView!
    @IBOutlet weak var countryDomainLabel: UILabel!
    @IBOutlet weak var countryAlfaLabel: UILabel!
    @IBOutlet weak var countryCodeLabel: UILabel!
    @IBOutlet weak var countryCapitalLabel: UILabel!
    @IBOutlet weak var countryLanguagesLabel: UILabel!
    @IBOutlet weak var countryRegionLabel: UILabel!
    @IBOutlet weak var countrySubregionLabel: UILabel!
    @IBOutlet weak var countryPopulationLabel: UILabel!
    @IBOutlet weak var countryNationalityLabel: UILabel!
    @IBOutlet weak var countryAreaLabel: UILabel!
    @IBOutlet weak var countryZoneLabel: UILabel!
    @IBOutlet weak var countryFrontiersLabel: UILabel!
    @IBOutlet weak var countryNativeLabel: UILabel!
    @IBOutlet weak var countryNumCodeLabel: UILabel!
    @IBOutlet weak var countryCurrencyLabel: UILabel!
    @IBOutlet weak var countryTranslationsLabel: UILabel!
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var contentScrollView: UIScrollView!
    @IBOutlet weak var popUpView: UIView!
    
    var country:CountryModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.countryFlagWebView.scrollView.isScrollEnabled = false
        self.countryFlagWebView.contentMode = .scaleAspectFit
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.masksToBounds = true
        self.contentScrollView.layer.cornerRadius = 10
        self.contentScrollView.layer.masksToBounds = true
        self.popUpView.layer.cornerRadius = 10
        self.popUpView.layer.masksToBounds = true
        self.locationButton.layer.cornerRadius = 5
        self.locationButton.layer.masksToBounds = true
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let request = URLRequest(url: (country?.flag)!)
        self.countryFlagWebView.load(request)
        
        self.countryDomainLabel.text = "Dominio: \((country?.borders?.joined(separator: ","))!)"
        self.countryAlfaLabel.text = "Código Alfa: \((country?.alpha2Code)!), \((country?.alpha3Code)!)"
        self.countryCodeLabel.text = "Código de marcación: \((country?.callingCodes?.joined(separator: ","))!)"
        self.countryCapitalLabel.text = "Capital: \((country?.capital)!)"
        let languages = self.getAllLanguages()
        self.countryLanguagesLabel.text = "Lenguajes: \(languages.joined(separator: ","))"
        self.countryRegionLabel.text = "Region: \((country?.region)!)"
        self.countrySubregionLabel.text = "Subregion: \((country?.subregion)!)"
        self.countryPopulationLabel.text = "Población: \((country?.population)!)"
        self.countryNationalityLabel.text = "Nacionalidad: \((country?.demonym)!)"
        self.countryAreaLabel.text = "Area: \((country?.area)!)"
        self.countryZoneLabel.text = "Zonas Horarias: \((country?.timezones?.joined(separator: ","))!)"
        self.countryFrontiersLabel.text = "Fronteras: \((country?.borders?.joined(separator: ","))!)"
        self.countryNativeLabel.text = "Nombre Nativo: \((country?.nativeName)!)"
        self.countryNumCodeLabel.text = "Código Numerico: \((country?.numericCode)!)"
        let currencies = self.getCurrencies()
        self.countryCurrencyLabel.text = "Moneda: \(currencies.joined(separator: ","))"
        let translations = self.getTranslations()
        self.countryTranslationsLabel.text = "Traducciones: \(translations.joined(separator: ","))"
    }
    
    func getTranslations() -> [String] {
        var translations:[String] = []
        translations.append((self.country?.translations!.br)!)
        translations.append((self.country?.translations!.de)!)
        translations.append((self.country?.translations!.es)!)
        translations.append((self.country?.translations!.fa)!)
        translations.append((self.country?.translations!.fr)!)
        translations.append((self.country?.translations!.hr)!)
        translations.append((self.country?.translations!.it)!)
        translations.append((self.country?.translations!.ja)!)
        translations.append((self.country?.translations!.nl)!)
        translations.append((self.country?.translations!.pt)!)
        
        return translations
    }
    
    func getCurrencies() -> [String] {
        var currencies:[String] = []
        for currency in country!.currencies!{
            currencies.append(currency.name!)
        }
        return currencies
    }
    
    func getAllLanguages() -> [String]{
        var languages:[String] = []
        for lang in country!.languages!{
            languages.append(lang.name!)
        }
        
        return languages
    }
    
    @IBAction func dismissController(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func showLocation(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "locationController") as! LocationViewController
        controller.country = country
        self.present(controller, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
