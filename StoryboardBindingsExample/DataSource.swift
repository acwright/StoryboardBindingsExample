//
//  DataSource.swift
//  StoryboardBindingsExample
//
//  Created by Aaron Wright on 4/27/15.
//  Copyright (c) 2015 Aaron Wright. All rights reserved.
//

import Cocoa

class DataSource: NSObject, NSCoding {

    var items: [Item] = []
    var selectionIndexes: NSIndexSet = NSIndexSet()
    
    convenience init(items: [Item]) {
        self.init()
        
        self.items = items
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        self.init()
        
        self.items = aDecoder.decodeObjectForKey("items") as! [Item]
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.items, forKey: "items")
    }
    
}
