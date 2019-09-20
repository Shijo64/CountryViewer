//
//  CountryTableViewCell.swift
//  CountryViewer
//
//  Created by Arturo Calvo on 9/18/19.
//  Copyright © 2019 Arturo Calvo. All rights reserved.
//

import UIKit
import SVGKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var countryImageView: UIImageView!
    @IBOutlet weak var countryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.countryImageView.sizeToFit()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(flag:SVGKImage, countryName:String){
        self.countryLabel.text = countryName
        self.countryImageView.image = flag.uiImage
    }
}
