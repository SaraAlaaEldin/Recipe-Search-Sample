//
//  RecipeDetailVC.swift
//  Recipe Search
//
//  Created by Sara Alaa on 11/30/19.
//  Copyright © 2019 Sara Alaa. All rights reserved.
//

import UIKit
import Alamofire
import  AlamofireImage
import SafariServices

class RecipeDetailVC: UIViewController {

    @IBOutlet weak var ingredientCollV:UICollectionView!{
           didSet{
               ingredientCollV.delegate = self
               ingredientCollV.dataSource = self

           }
       }
       @IBOutlet  weak var receipeImgV:UIImageView!
       @IBOutlet  weak var publisherButton:UIButton!
       @IBOutlet  weak var titleLabel:UILabel!
       @IBOutlet weak var contentView:UIView!{
        didSet
        {
            contentView.animateView()
        }
    }
      var recipeObject: RecipeVM?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ingredientCollV.register(UINib(nibName: "HeatesLabelsCCell", bundle: nil), forCellWithReuseIdentifier: "heatesLabelcell")
        setValues()
    }
    
  

    func setValues(){
          titleLabel.text = self.recipeObject?.label
        publisherButton.addAttribute(text: self.recipeObject?.source ?? "")
          guard let url = URL(string: self.recipeObject?.image ?? "" ) else { return }

          receipeImgV?
              .af_setImage(
                  withURL: url,
                     placeholderImage: #imageLiteral(resourceName: "vegetables-on-wood-concept-vector-11216576"),
                     filter: nil,
                     imageTransition: .crossDissolve(0.2)
                 )
          
        ingredientCollV.reloadData()
        ingredientCollV.animateCollectionView()
      }
    
    @IBAction func sourceBtn(){
        if let url = URL(string: self.recipeObject?.url ?? "" ) {
            if #available(iOS 11.0, *) {
                let config = SFSafariViewController.Configuration()
                config.entersReaderIfAvailable = true
                let vc = SFSafariViewController(url: url, configuration: config)
                present(vc, animated: true)
            } else {
                // Fallback on earlier versions
                let vc = SFSafariViewController(url: url, entersReaderIfAvailable: true)
                present(vc, animated: true)

            }
             
           }
    }
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true)
    }
   
    @IBAction func backBtn(_ sender:UIButton){
        self.navigationController?.popViewController(animated: true)
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

extension RecipeDetailVC:UICollectionViewDelegate , UICollectionViewDataSource
    , UICollectionViewDelegateFlowLayout
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return  recipeObject?.ingredientLines?.count ?? 0
      }
      
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cItem = collectionView.dequeueReusableCell(withReuseIdentifier: "heatesLabelcell", for: indexPath) as! HeatesLabelsCCell
        guard let item = self.recipeObject?.ingredientLines?[indexPath.item] else {
            return cItem
        }
        cItem.configItem(heatLabel: item)
        return cItem
    }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let w = self.view.frame.size.width - 20

            return CGSize(width: w, height:40)
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
