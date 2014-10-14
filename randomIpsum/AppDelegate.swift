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
  
  enum IpsumType {
    case Lorem
    case Bacon
  }
  
  enum TextType {
    case Line
    case Paragraph
  }
  
  var pasteBoard = NSPasteboard.generalPasteboard()
  var statusBarIcon = NSStatusBar.systemStatusBar().statusItemWithLength(-1)
  var chosenIpsum = IpsumType.Lorem
  var chosenIpsumURL = "http://loripsum.net/api/plaintext/"
  
  func sendToPasteBoard(text: String) {
    pasteBoard.clearContents()
    pasteBoard.writeObjects([text])
  }
  
  func getLoremIpsum(textAmount: Int, textType: TextType) {
    var urlSuffix = ""

    switch chosenIpsum {
    case .Lorem:
      switch textType {
      case .Line:
        urlSuffix = "\(textAmount)/short"
      case .Paragraph:
        urlSuffix = "\(textAmount)/medium"
      }
      
    case .Bacon:
      switch textType {
      case .Line:
        urlSuffix = "sentences=\(textAmount)"
      case .Paragraph:
        urlSuffix = "sentences=\(textAmount)"
      }
    }
    
    let url = NSURL(string: (chosenIpsumURL + urlSuffix))
    let request = NSURLRequest(URL: url!)
    NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {(response, data, error) in
      self.sendToPasteBoard((NSString(data: data, encoding: NSUTF8StringEncoding) ?? "nope"))
    }
  }
  
  func loremIpsum(sender: NSMenuItem) {
    chosenIpsum = .Lorem
    chosenIpsumURL = "http://loripsum.net/api/plaintext/"
  }
  
  func baconIpsum(sender: NSMenuItem) {
    chosenIpsum = .Bacon
    chosenIpsumURL = "http://baconipsum.com/api/?type=all-meat&start-with-lorem=1&"
  }
  
  func oneLine(sender: NSMenuItem) {
    getLoremIpsum(1, textType: TextType.Line)
  }
  
 func twoLine(sender: NSMenuItem) {
    getLoremIpsum(2, textType: TextType.Line)
  }
  
  
  func initMenu() {
    var randomIpsumMenu = NSMenu()
    var mainMenu = NSMenuItem()
    
    var ipsumMenu = NSMenu()
    var ipsumMenuItem = NSMenuItem(title: "Ipsum", action: nil, keyEquivalent: "")
    var loremIpsum = NSMenuItem(title: "Lorem", action: Selector("loremIpsum:"), keyEquivalent: "")
    var baconIpsum = NSMenuItem(title: "Bacon", action: Selector("baconIpsum:"), keyEquivalent: "")
    
    loremIpsum.state = 1;
    
    ipsumMenu.addItem(loremIpsum)
    ipsumMenu.addItem(baconIpsum)
    
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

