//
//  AppDelegate.swift
//  randomIpsum
//
//  Created by Mike Rivera on 10/3/14.
//  Copyright (c) 2014 Mike Rivera. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var pasteBoard = NSPasteboard.generalPasteboard()
    var statusBarIcon = NSStatusBar.systemStatusBar().statusItemWithLength(-1)

    func oneWord(sender: NSMenuItem) {
        pasteBoard.clearContents()
        pasteBoard.writeObjects(["one"])
    }
    
    func twoWord(sender: NSMenuItem) {
        pasteBoard.clearContents()
        pasteBoard.writeObjects(["two"])
    }
    
    func threeWord(sender: NSMenuItem) {
    }
    
    func fourWord(sender: NSMenuItem) {
    }
    
    func fiveWord(sender: NSMenuItem) {
    }
    
    
    func initMenu() {
        var randomIpsumMenu = NSMenu()
        var mainMenu = NSMenuItem()

        var languageMenu = NSMenu()
        var languageMenuItem = NSMenuItem()
        
        
        var latinLanugage = NSMenuItem(title: "Latin", action: nil, keyEquivalent: "")
        languageMenu.addItem(latinLanugage)
        
        languageMenuItem.title = "Choose Language"
        
        randomIpsumMenu.setSubmenu(languageMenu, forItem: languageMenuItem)
        randomIpsumMenu.addItem(languageMenuItem)
        randomIpsumMenu.addItem(NSMenuItem.separatorItem())

        
        self.statusBarIcon.menu = randomIpsumMenu
    }

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        self.statusBarIcon.title = "RI"
        
        initMenu()
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

