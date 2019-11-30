//
//  ViewController.swift
//  Recipe Search
//
//  Created by Sara Alaa on 11/25/19.
//  Copyright © 2019 Sara Alaa. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {

    @IBOutlet weak var searchTableV:UITableView!{
        didSet{
            searchTableV.isHidden = true
            searchTableV.delegate = self
            searchTableV.dataSource = self
        }
    }
    @IBOutlet weak var suggesgionListTV:UITableView!{
         didSet{
             suggesgionListTV.isHidden = true
             suggesgionListTV.delegate = self
             suggesgionListTV.dataSource = self
         }
     }
    @IBOutlet weak var searchHintLabel:UILabel!{
        didSet{
            searchHintLabel.isHidden = false
            
        }
        
    }
    var spinner = UIActivityIndicatorView()

    var serchListVM :SLM? = SLM()
    var suggestionList:[String]? = [String]()

    var recipeItems:[HitsVM] = [HitsVM]()
    var from = 0
    var to = 10

    @IBOutlet weak var searchBar:UISearchBar!{
        didSet{
            searchBar.delegate = self
            searchBar.showsCancelButton = true

        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
       
        showLast10()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       // self.animation()
        
        searchTableV.register(UINib(nibName: "RecipeItemTCell", bundle: nil), forCellReuseIdentifier: "recipeCell")
    
        suggesgionListTV.register(UITableViewCell.self, forCellReuseIdentifier: "suggCell")
        createLoadIndecator()
        
    }
    func createLoadIndecator(){
        if #available(iOS 13.0, *) {
            spinner = UIActivityIndicatorView(style: .large)
        } else {
            // Fallback on earlier versions
            spinner = UIActivityIndicatorView(style: .whiteLarge)

        }
        spinner.color = #colorLiteral(red: 0.5237524509, green: 0.04315282404, blue: 0.09482961148, alpha: 1)
        spinner.stopAnimating()
        spinner.hidesWhenStopped = true
        spinner.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 60)
        searchTableV.tableFooterView = spinner

       }
  
}


extension SearchVC :UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        guard tableView != suggesgionListTV  else {
            count  =  suggestionList?.count ?? 0
            return count
        }
        
        guard tableView != searchTableV else {
         count = self.recipeItems.count
            return count
        }
       return count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard tableView != suggesgionListTV else {
            let cell =  tableView.dequeueReusableCell(withIdentifier: "suggCell")
            let item = suggestionList?[indexPath.row]
            cell?.textLabel?.text = item
            return cell ?? UITableViewCell()

        }
        let cell =  tableView.dequeueReusableCell(withIdentifier: "recipeCell") as! RecipeItemTCell
        let item = self.recipeItems[indexPath.row]
        
        guard let recipe = item.recipe else {
            return cell
        }
        cell.configCell(recipe:recipe )
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard tableView != suggesgionListTV else {
            let cell = tableView.cellForRow(at: indexPath)
            searchBar.text = cell?.textLabel?.text
            return
        }
        guard tableView != searchTableV else {
            let cell = tableView.cellForRow(at: indexPath) as! RecipeItemTCell
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "RecipeDetailVC") as! RecipeDetailVC
                           vc.recipeObject = cell.recipeObject
            self.navigationController?.pushViewController(vc, animated: true)

                return
              }
    }
    
     func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
            let offset = scrollView.contentOffset
            let bounds = scrollView.bounds
            let size = scrollView.contentSize
            let inset = scrollView.contentInset
            let y = offset.y + bounds.size.height - inset.bottom
            let h = size.height
            let reloadDistance = CGFloat(30.0)
            if y > h + reloadDistance {
                print("fetch more data")
                
                guard suggesgionListTV.isHidden else {return}
                guard serchListVM?.more ?? false  else {
                    spinner.stopAnimating()
                    return
                }
                from = recipeItems.count
                to = from + 10
                getResultOfSearch()
                spinner.startAnimating()
            }
    }
   
    func showLast10(){
        suggestionList = Constants.getSuggetionList()
             
             guard let count10 = suggestionList?.count ?? 0 as Int? else {
                 return
             }
             if count10 > 10 {
                 suggestionList?.removeFirst(count10 - 10)
             }
        
        suggesgionListTV.reloadData()
        suggesgionListTV.scrollToTop(animated: true)
    }
}


extension SearchVC: UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if suggestionList?.contains(searchBar.text ?? "") == false {
            suggestionList?.append( searchBar.text ?? "")
        }
        Constants.setSuggList(items: suggestionList ?? [])
        suggesgionListTV.isHidden = true
    self.view.endEditing(true)
        from = 0
        to = 10
         self.recipeItems = []
        ad.isLoading()
        getResultOfSearch()
        
    }
    
    func getResultOfSearch(){
        guard let q = searchBar.text  else {
            return
        }
        
        let url = "\(URLS.baseURLSearch)?q=" + (q) + "&app_id=\(URLS.appId)" + "&app_key=\(URLS.appKey)&from=\(from)&to=\(to)"
        print("url",url)
            serchListVM?.searchTheRecipe(url:url ,completion: { response ,status in
                DispatchQueue.main.async {
                    guard status != nil else {
                        self.showAlert(title: "Error", msg: "There is some error hapen , please heck your connection and try again later")
                        ad.killLoading()
                        return
                    }
                    self.serchListVM = response
                    self.serchListVM?.hits?.forEach({
                        item in
                        self.recipeItems.append(item)
                    })
                    guard  let count = response?.hits?.count , count  > 0  else {
                        self.searchTableV.isHidden = true
                        self.searchHintLabel.isHidden = false
                        self.searchHintLabel.text = "No result found"
                        ad.killLoading()

                        return
                    }   
                    self.searchTableV.isHidden = false
                    self.searchHintLabel.isHidden = true
                    ad.killLoading()

                    self.searchTableV.reloadData()
                    self.searchTableV.scrollToTop(animated: true)
                    self.searchTableV.animateTableView()
                }
            }, failure: {_ in
                
            })
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        suggesgionListTV.isHidden = false
        showLast10()
        return true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        suggesgionListTV.isHidden = true
        self.view.endEditing(true)
    }
    
    
}
