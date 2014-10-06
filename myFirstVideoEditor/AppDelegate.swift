//
//  AppDelegate.swift
//  myFirstVideoEditor
//
//  Created by Guido Grassel on 05/10/14.
//  Copyright (c) 2014 Guido Grassel. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        // Insert code here to initialize your application
        var panel = ClipSelectionPanel();
        panel.enumerateClips()
    }

    func applicationWillTerminate(aNotification: NSNotification?) {
        // Insert code here to tear down your application
    }


}

