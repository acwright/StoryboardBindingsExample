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
    
    override func windowControllerDidLoadNib(aController: NSWindowController) {
        super.windowControllerDidLoadNib(aController)
        // Add any code here that needs to be executed once the windowController has loaded the document's window.
    }
    
    override class func autosavesInPlace() -> Bool {
        return true
    }
    
    override func makeWindowControllers() {
        // Returns the Storyboard that contains your Document window.
        let storyboard = NSStoryboard(name: "Main", bundle: nil)!
        let windowController = storyboard.instantiateControllerWithIdentifier("Document Window Controller") as! NSWindowController
        self.addWindowController(windowController)
    }
    
    // MARK: Serialization / Deserialization
    
    override func readFromData(data: NSData, ofType typeName: String, error outError: NSErrorPointer) -> Bool {
        if let dataSource = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? DataSource {
            self.dataSource = dataSource
            
            return true
        }
        
        if outError != nil {
            outError.memory = NSError(domain: NSCocoaErrorDomain, code: NSFileReadCorruptFileError, userInfo: [
                NSLocalizedDescriptionKey: NSLocalizedString("Could not read file.", comment: "Read error description"),
                NSLocalizedFailureReasonErrorKey: NSLocalizedString("File was in an invalid format.", comment: "Read failure reason")
            ])
        }
        
        return false
    }
    
    override func dataOfType(typeName: String, error outError: NSErrorPointer) -> NSData? {
        if let dataSource = self.dataSource {
            return NSKeyedArchiver.archivedDataWithRootObject(dataSource)
        }
        
        return nil
    }


}

