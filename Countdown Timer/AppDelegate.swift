//
//  AppDelegate.swift
//  Countdown Timer
//
//  Created by CHAN Hong Wing on 11/10/2020.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    //    var window: NSWindow!
    var popover = NSPopover.init()
    var statusBar: StatusBarController?
    
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()
        
        // Set the SwiftUI's ContentView to the Popover's ContentViewController
        popover.contentSize = NSSize(width: 360, height: 360)
        popover.contentViewController = NSHostingController(rootView: contentView)
        
        // Create the window and set the content view.
        //        window = NSWindow(
        //            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
        //            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
        //            backing: .buffered, defer: false)
        //        window.isReleasedWhenClosed = false
        //        window.center()
        //        window.setFrameAutosaveName("Main Window")
        //        window.contentView = NSHostingView(rootView: contentView)
        //        window.makeKeyAndOrderFront(nil)
        
        statusBar = StatusBarController.init(popover)
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    
}

