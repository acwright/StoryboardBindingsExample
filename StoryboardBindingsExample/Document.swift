//
//  Document.swift
//  StoryboardBindingsExample
//
//  Created by Aaron Wright on 4/27/15.
//  Copyright (c) 2015 Aaron Wright. All rights reserved.
//

import Cocoa

class Document: NSDocument {

    var dataSource: DataSource? = DataSource()
    
    override init() {
        super.init()
        // Add your subclass-specific initialization here.
    }
    
    override func windowControllerDidLoadNib(_ aController: NSWindowController) {
        super.windowControllerDidLoadNib(aController)
        // Add any code here that needs to be executed once the windowController has loaded the document's window.
    }
    
    override class func autosavesInPlace() -> Bool {
        return true
    }
    
    override func makeWindowControllers() {
        // Returns the Storyboard that contains your Document window.
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: "Document Window Controller") as! NSWindowController
        self.addWindowController(windowController)
    }
    
    // MARK: Serialization / Deserialization
    
    override func read(from data: Data, ofType typeName: String) throws {
        if let dataSource = NSKeyedUnarchiver.unarchiveObject(with: data) as? DataSource {
            self.dataSource = dataSource
        } else {
            throw NSError(domain: "Document", code: 0, userInfo: nil)
        }
    }
    
    override func data(ofType typeName: String) throws -> Data {
        if let dataSource = self.dataSource {
            return NSKeyedArchiver.archivedData(withRootObject: dataSource)
        } else {
            throw NSError(domain: "Document", code: 0, userInfo: nil)
        }
    }


}

