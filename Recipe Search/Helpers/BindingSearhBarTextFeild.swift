//
//  BindingSearhBarTextFeild.swift
//  Recipe Search
//
//  Created by Sara Alaa on 11/27/19.
//  Copyright © 2019 Sara Alaa. All rights reserved.
//

import Foundation
import UIKit


class BindingTextFeild : UITextField {
    
    var textChanged :(String) -> () = { _ in }
    
    
    func bind(callback :@escaping (String) -> ()) {
       
        self.textChanged = callback
        self.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField :UITextField) {
        
        self.textChanged(textField.text!)
    }
}
