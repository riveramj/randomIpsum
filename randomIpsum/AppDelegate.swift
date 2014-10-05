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
    
    
    func initMenu() {
        var randomIpsumMenu = NSMenu()
        var mainMenu = NSMenuItem()

        var languageMenu = NSMenu()
        var languageMenuItem = NSMenuItem(title: "Choose Language", action: nil, keyEquivalent: "")
        var latinLanugage = NSMenuItem(title: "Latin", action: nil, keyEquivalent: "")
        
        latinLanugage.state = 1;
        
        languageMenu.addItem(latinLanugage)
        
        randomIpsumMenu.setSubmenu(languageMenu, forItem: languageMenuItem)
        randomIpsumMenu.addItem(languageMenuItem)
        
        randomIpsumMenu.addItem(NSMenuItem.separatorItem())
        
        var wordMenu = NSMenu()
        var wordMenuItem = NSMenuItem(title: "Word", action: nil, keyEquivalent: "")
        var oneWordItem = NSMenuItem(title: "1", action: Selector("oneWord:"), keyEquivalent: "")
        var twoWordItem = NSMenuItem(title: "2", action: Selector("twoWord:"), keyEquivalent: "")

        wordMenu.addItem(oneWordItem)
        wordMenu.addItem(twoWordItem)
        
        randomIpsumMenu.setSubmenu(wordMenu, forItem: wordMenuItem)
        randomIpsumMenu.addItem(wordMenuItem)
        
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

