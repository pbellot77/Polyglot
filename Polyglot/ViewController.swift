//
//  ViewController.swift
//  Polyglot
//
//  Created by Patrick Bellot on 11/28/16.
//  Copyright © 2016 Bell OS, LLC. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
  
  var words = [String]()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let titleAttributes = [NSFontAttributeName: UIFont(name: "AmericanTypewriter", size: 22)!]
    navigationController?.navigationBar.titleTextAttributes = titleAttributes
    title = "POLYGLOT"
    
    let defaults = UserDefaults.standard
    
    if let savedWords = defaults.object(forKey: "Words") as? [String] {
      words = savedWords
    } else {
      saveInitialValues(to: defaults)
    }
  }
  
  func saveInitialValues(to defaults: UserDefaults) {
    words.append("bear::l'ours")
    words.append("camel::le chameau")
    words.append("cow::la vache")
    words.append("fox::le renard")
    words.append("goat::la chevre")
    words.append("monkey::le singe")
    words.append("pig::le cochon")
    words.append("rabbit::le lapin")
    words.append("sheep::le mouton")
    
    defaults.set(words, forKey: "Words")
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
  }


}

