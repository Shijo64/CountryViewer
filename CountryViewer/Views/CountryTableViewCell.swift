//
//  CountryTableViewCell.swift
//  CountryViewer
//
//  Created by Arturo Calvo on 9/18/19.
//  Copyright © 2019 Arturo Calvo. All rights reserved.
//

import UIKit
import SVGParser
import EasySVG

class CountryTableViewCell: UITableViewCell {
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var flagImageView: UIImageView!
    
    let flagsCache = NSCache<NSString, UIImage>()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        EasySVG.allowCache = true
        // Initialization code
        //self.flagImageWebView.contentMode = .scaleAspectFit
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(country:CountryModel){
        self.countryLabel.text = country.name!
        
        
        if let cachedFlag = self.flagsCache.object(forKey: NSString(string: country.name!)){
            self.flagImageView.image = cachedFlag
        }else{
            do{
                let data = try Data(contentsOf: country.flag!)
                parseSVG(data){ image in
                    self.flagsCache.setObject(image, forKey: NSString(string: country.name!))
                    self.flagImageView.image = image
                }
            }
            catch{
                self.flagImageView.image = UIImage(named: "placeholder")
            }
        }
    }
    
    func parseSVG(_ data: Data, completionHandler: @escaping (UIImage) -> Void) {
        
        DispatchQueue.main.async {
            SVGParser(xmlData: data).scaledImageWithSize(CGSize(width: 40, height: 40), completion: { image in
                if let img = image {
                    completionHandler(img)
                }
            })
        }
    }
}
