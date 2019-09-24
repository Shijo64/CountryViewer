//
//  CountryTableViewCell.swift
//  CountryViewer
//
//  Created by Arturo Calvo on 9/18/19.
//  Copyright © 2019 Arturo Calvo. All rights reserved.
//

import UIKit
import SVProgressHUD
import WebKit

class CountryTableViewCell: UITableViewCell {
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var flagWebView: WKWebView!
    
    
    let flagsCache = NSCache<NSString, UIImage>()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //self.flagImageWebView.contentMode = .scaleAspectFit
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(country:CountryModel){
        self.countryLabel.text = country.name!
        self.flagWebView.scrollView.isScrollEnabled = false
        self.flagWebView.layer.cornerRadius = self.flagWebView.frame.width/2
        self.flagWebView.layer.masksToBounds = true
        let flagRequest = URLRequest(url: country.flag!)
        self.flagWebView.load(flagRequest)
    }
}
