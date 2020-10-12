//
//  StatusBarController.swift
//  Countdown Timer
//
//  Created by CHAN Hong Wing on 11/10/2020.
//

import Foundation
import AppKit

class StatusBarController {
    private var statusBar: NSStatusBar
    private var statusItem: NSStatusItem
    private var popover: NSPopover
    private var eventMonitor: EventMonitor?
    
    init(_ popover: NSPopover) {
        self.popover = popover
        statusBar = NSStatusBar.init()
        // Creating a status bar item having a fixed length
        statusItem = statusBar.statusItem(withLength: NSStatusItem.variableLength)
        if let statusBarButton = statusItem.button {

            statusBarButton.action = #selector(togglePopover(sender:))
            statusBarButton.target = self
            
            // create an NSMutableAttributedString that we'll append everything to
            let fullString = NSMutableAttributedString(string: "Start of text")

            // create our NSTextAttachment
            let image1Attachment = NSTextAttachment()
            image1Attachment.image = #imageLiteral(resourceName: "countdown")
            image1Attachment.bounds = CGRect(x: 0, y: 0, width: 15, height: 15)

            // wrap the attachment in its own attributed string so we can append it
            let image1String = NSAttributedString(attachment: image1Attachment)

            // add the NSTextAttachment wrapper to our full string, then add some more text.
            fullString.append(image1String)
            fullString.append(NSAttributedString(string: "End of text"))

            
            statusBarButton.attributedTitle =  fullString
        }
        
        
        eventMonitor = EventMonitor(mask: [.leftMouseDown, .rightMouseDown], handler: mouseEventHandler)
    }
    
    @objc func togglePopover(sender: AnyObject) {
        if(popover.isShown) {
            hidePopover(sender)
        }
        else {
            showPopover(sender)
        }
    }
    
    func showPopover(_ sender: AnyObject) {
        if let statusBarButton = statusItem.button {
            popover.show(relativeTo: statusBarButton.bounds, of: statusBarButton, preferredEdge: NSRectEdge.maxY)
            eventMonitor?.start()
        }
    }
    
    func hidePopover(_ sender: AnyObject) {
        popover.performClose(sender)
        eventMonitor?.stop()
    }
    
    func mouseEventHandler(_ event: NSEvent?) {
        if(popover.isShown) {
            hidePopover(event!)
        }
    }
}
