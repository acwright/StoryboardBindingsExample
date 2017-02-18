//
//  Item.swift
//  StoryboardBindingsExample
//
//  Created by Aaron Wright on 4/27/15.
//  Copyright (c) 2015 Aaron Wright. All rights reserved.
//

import Cocoa

class Item: NSObject, NSCoding {

    var name: String = "New Item"
    
    convenience init(name: String) {
        self.init()
        
        self.name = name
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        self.init()
        
        self.name = aDecoder.decodeObject(forKey: "name") as! String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name")
    }
    
}
