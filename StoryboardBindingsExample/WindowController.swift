//
//  WindowController.swift
//  StoryboardBindingsExample
//
//  Created by Aaron Wright on 4/27/15.
//  Copyright (c) 2015 Aaron Wright. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {
    
    override var document: AnyObject? {
        didSet {
            if let document = self.document as? Document {
                self.contentViewController?.representedObject = document
            }
        }
    }

}
