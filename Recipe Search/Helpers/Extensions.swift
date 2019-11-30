//
//  Extensions.swift
//  Recipe Search
//
//  Created by Sara Alaa on 11/28/19.
//  Copyright © 2019 Sara Alaa. All rights reserved.
//

import Foundation

import  NVActivityIndicatorView
let ad = UIApplication.shared.delegate as! AppDelegate

extension AppDelegate{

      func isLoading(message:String? = nil) {
             guard let sms = message else {
            NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData, nil)
            
                return
            }
            let size = CGSize(width: 45   , height: 45)
        self.window?.currentViewController()?.startAnimating(size, message: sms,messageFont: UIFont.systemFont(ofSize: 16), type: .ballSpinFadeLoader, textColor: #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1))


         }
        
        func killLoading() {
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
        }
}
extension UIViewController :NVActivityIndicatorViewable{
    func loading(message : String? = "" )
    {
        guard let sms =  message  , sms != "" else {
             startAnimating()
            return
        }
        let size = CGSize(width: 45   , height: 45)
        startAnimating(size, message: sms,messageFont: UIFont.systemFont(ofSize: 16), type: .ballSpinFadeLoader, textColor: #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1))
     }
    
 
    func killLoading()
    {
        stopAnimating()
//        AMProgressHUD.dismiss()
    }
    
    @objc   func dismissViewC() {
        if self.navigationController == nil {
            self.dismiss(animated: true, completion: nil)
        }else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func showAlert(title:String,msg:String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
              switch action.style{
              case .default:
                    print("default")

              case .cancel:
                    print("cancel")

              case .destructive:
                    print("destructive")

              @unknown default:
                print("error")

            }}))
        self.present(alert, animated: true, completion: nil)

    }
    func animation(){
        let transition: UIView.AnimationOptions = .transitionFlipFromLeft
             UIView.transition(with: self.view, duration: 0.55001, options: transition, animations: { () -> Void in
                     }) { (finished) -> Void in
                         
                     }
    }
  
}

/** @abstract UIWindow hierarchy category.  */
public extension UIWindow {
    
    /** @return Returns the current Top Most ViewController in hierarchy.   */
    func topMostWindowController()->UIViewController? {
        
        var topController = rootViewController
        
        while let presentedController = topController?.presentedViewController {
            topController = presentedController
        }
        
        return topController
    }
    
    /** @return Returns the topViewController in stack of topMostWindowController.    */
    func currentViewController()->UIViewController? {
        
        var currentViewController = topMostWindowController()
        
        while currentViewController != nil && currentViewController is UINavigationController && (currentViewController as! UINavigationController).topViewController != nil {
            currentViewController = (currentViewController as! UINavigationController).topViewController
        }
        
        return currentViewController
    }
}

extension UITableView {
    func hasRowAtIndexPath(indexPath: IndexPath) -> Bool {
        return indexPath.section < self.numberOfSections && indexPath.row < self.numberOfRows(inSection: indexPath.section)
    }
    
    func scrollToTop(animated: Bool) {
        let indexPath = IndexPath(row: 0, section: 0)
        if self.hasRowAtIndexPath(indexPath: indexPath) {
            DispatchQueue.main.async {
                self.scrollToRow(at: indexPath, at: .top, animated: animated)
            }
        }
    }
    
     func animateTableView() {
                
                let cells = self.visibleCells
                for i in cells {
                    let cell = i as UITableViewCell
                     cell.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                 }
                var index = 0
                
                for a in cells {
                    let cell = a as UITableViewCell
                  UIView.animate(withDuration: 1.0, delay: 0.05 * Double(index), usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: [.curveEaseOut,.allowUserInteraction], animations: {
                        cell.transform = .identity
                    })
                    index += 1
                }
            }
      
    
}

extension UICollectionView {
    func hasRowAtIndexPath(indexPath: IndexPath) -> Bool {
        return indexPath.section < self.numberOfSections && indexPath.row < self.numberOfItems(inSection: indexPath.section)
    }
    
    func scrollToTop(animated: Bool) {
        let indexPath = IndexPath(row: 0, section: 0)
        if self.hasRowAtIndexPath(indexPath: indexPath) {
            DispatchQueue.main.async {
                self.scrollToItem(at: indexPath, at: .top, animated: animated)
            }
        }
    }
    
    func animateCollectionView() {
          
          UIView.animate(withDuration: 1.0, animations:
                             {
                              self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                             }) { (true) in
                             UIView.animate(withDuration: 0.5, animations:
                             {
                              self.transform =   CGAffineTransform(scaleX: 1.0, y: 1.0)
                             })
                         }
                      }
}


extension UIView{
    func animateView(){
        UIView.animate(withDuration: 1.0, animations:
                                   {
                                    self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                                   }) { (true) in
                                   UIView.animate(withDuration: 0.5, animations:
                                   {
                                    self.transform =   CGAffineTransform(scaleX: 1.0, y: 1.0)
                                   })
                               }
                            }
    }

extension UIButton{
    func addAttribute(text:String){
        
        let yourAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor.black,
            .underlineStyle: NSUnderlineStyle.single.rawValue]
        let attributeString = NSMutableAttributedString(string: text,
                                                        attributes: yourAttributes)
        self.setAttributedTitle(attributeString, for: .normal)

    }
    
}
