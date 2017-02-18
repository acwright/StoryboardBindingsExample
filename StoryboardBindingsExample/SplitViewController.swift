//
//  SplitViewController.swift
//  StoryboardBindingsExample
//
//  Created by Aaron Wright on 4/26/15.
//  Copyright (c) 2015 Aaron Wright. All rights reserved.
//

import Cocoa

class SplitViewController: NSSplitViewController {

    override var representedObject: Any? {
        didSet {
            for viewController in self.childViewControllers {
                viewController.representedObject = representedObject
            }
        }
    }
}
