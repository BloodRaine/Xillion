//
//  item.swift
//  Xillion
//
//  Created by Robbie Merillat on 12/23/16.
//  Copyright © 2016 Robbie Merillat. All rights reserved.
//

import Foundation
import UIKit

class Item {
    var name: String = ""
    var image = UIImage(named:"test")
    
    func use() {
        // Function dictating how each item is used if if has a use.
    }
    
    func setImage(imageName:String) {
        image = UIImage(named:imageName)
    }
    
}
