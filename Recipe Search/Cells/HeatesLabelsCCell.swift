//
//  HeatesLabels.swift
//  Recipe Search
//
//  Created by Sara Alaa on 11/26/19.
//  Copyright © 2019 Sara Alaa. All rights reserved.
//

import UIKit

class HeatesLabelsCCell: UICollectionViewCell {
    @IBOutlet  weak var heatLabel:UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
               
    }

    func configItem(heatLabel:String){
        self.heatLabel.text =  heatLabel
    }
}
