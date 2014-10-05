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
    
    var statusBar = NSStatusBar.systemStatusBar()

    var appMenu: NSMenu = NSMenu()

    var languageMenu: NSMenuItem!
    var wordMenu: NSMenuItem!
    
    var latinLanguage: NSMenuItem!

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
    
    override func awakeFromNib() {
        languageMenu.menu = appMenu
        languageMenu.title = "Choose Language"
    
//        menuItem.title = "Clicked"
//        menuItem.action = Selector("setWindowVisible:")
//        menuItem.keyEquivalent = ""
//        appMenu.addItem(languageMenu)
    }

    func applicationDidFinishLaunching(aNotification: NSNotification) {
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

