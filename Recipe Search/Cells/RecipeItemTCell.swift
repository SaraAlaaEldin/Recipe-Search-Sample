//
//  recipeItemTCell.swift
//  Recipe Search
//
//  Created by Sara Alaa on 11/25/19.
//  Copyright © 2019 Sara Alaa. All rights reserved.
//

import UIKit
import Alamofire
import  AlamofireImage
class RecipeItemTCell: UITableViewCell {

    @IBOutlet weak var recipeCollV:UICollectionView!{
        didSet{
            recipeCollV.delegate = self
            recipeCollV.dataSource = self

        }
    }
    @IBOutlet  weak var receipeImgV:UIImageView!
    @IBOutlet  weak var sourceLabel:UILabel!
    @IBOutlet  weak var titleLabel:UILabel!
   
    var recipeObject: RecipeVM?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        recipeCollV.register(UINib(nibName: "HeatesLabelsCCell", bundle: nil), forCellWithReuseIdentifier: "heatesLabelcell")

    }
    
    
    func configCell(recipe:RecipeVM){
        self.recipeObject = recipe
        sourceLabel.text = self.recipeObject?.source
        titleLabel.text = self.recipeObject?.label
        guard let url = URL(string: self.recipeObject?.image ?? "" ) else { return }

        receipeImgV?
            .af_setImage(
                withURL: url,
                   placeholderImage: #imageLiteral(resourceName: "vegetables-on-wood-concept-vector-11216576"),
                   filter: nil,
                   imageTransition: .crossDissolve(0.2)
               )
        
        self.recipeCollV.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension RecipeItemTCell:UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        guard let hitsCount = self.recipeObject?.healthLabels?.count else { return 0}
        
        guard let sec = Int(Float(hitsCount/2).rounded(.up)) as Int? else  {
            return 0
        }
        
        return sec

      }
      
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let hitsCount = self.recipeObject?.healthLabels?.count else { return 0}
        
        guard let sec = Int(Float(hitsCount/2).rounded(.up)) as Int? else  {
            return 0
        }

        guard section == sec - 1 , hitsCount%2 == 1 else {
            return 2
        }
        return 1

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cItem = collectionView.dequeueReusableCell(withReuseIdentifier: "heatesLabelcell", for: indexPath) as! HeatesLabelsCCell
        
        var index:Int?
               if indexPath.item%2 == 0{
                   index = indexPath.section * 2
               }else {
                   index = indexPath.section * 2 + 1
               }
              
        guard let item = self.recipeObject?.healthLabels?[index ?? 0] else {
            return cItem
        }
        cItem.configItem(heatLabel: item)
        return cItem
    }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          let w = 150
            return CGSize(width: w, height:w/4)
        }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           return 0
       }
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 0
       }
   
}
