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

  
  func sendToPasteBoard(text: String) {
    pasteBoard.clearContents()
    pasteBoard.writeObjects([text])
  }
  
  func getLoremIpsum(requestedLength: String) {
    let url = NSURL(string: "http://loripsum.net/api/" + requestedLength)
    let request = NSURLRequest(URL: url!)
    NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {(response, data, error) in
      self.sendToPasteBoard((NSString(data: data, encoding: NSUTF8StringEncoding) ?? "nope"))
    }
  }
  
  func oneLine(sender: NSMenuItem) {
    getLoremIpsum("/1/short/plaintext")
  }
  
  func twoLine(sender: NSMenuItem) {
    getLoremIpsum("/2/short/plaintext")
  }
  
  
  func initMenu() {
    var randomIpsumMenu = NSMenu()
    var mainMenu = NSMenuItem()
    
    var ipsumMenu = NSMenu()
    var ipsumMenuItem = NSMenuItem(title: "Ipsum", action: nil, keyEquivalent: "")
    var loremIpsum = NSMenuItem(title: "Lorem", action: nil, keyEquivalent: "")
    
    loremIpsum.state = 1;
    
    ipsumMenu.addItem(loremIpsum)
    
    randomIpsumMenu.setSubmenu(ipsumMenu, forItem: ipsumMenuItem)
    randomIpsumMenu.addItem(ipsumMenuItem)
    
    randomIpsumMenu.addItem(NSMenuItem.separatorItem())
    
    var lineMenu = NSMenu()
    var lineMenuItem = NSMenuItem(title: "Line", action: nil, keyEquivalent: "")
    var oneLineItem = NSMenuItem(title: "1", action: Selector("oneLine:"), keyEquivalent: "")
    var twoLineItem = NSMenuItem(title: "2", action: Selector("twoLine:"), keyEquivalent: "")
    
    lineMenu.addItem(oneLineItem)
    lineMenu.addItem(twoLineItem)
    
    randomIpsumMenu.setSubmenu(lineMenu, forItem: lineMenuItem)
    randomIpsumMenu.addItem(lineMenuItem)
    
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

