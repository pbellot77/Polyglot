//
//  TodayViewController.swift
//  Widget
//
//  Created by Patrick Bellot on 12/5/16.
//  Copyright © 2016 Bell OS, LLC. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding, UITableViewDataSource, UITableViewDelegate {
        
  @IBOutlet weak var tableView: UITableView!
  
  var words = [String]()
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let defaults = UserDefaults(suiteName: "group.com.patrickBellot.Polyglot")
    if let savedWords = defaults?.object(forKey: "Words") as? [String] {
      words = savedWords
    }
    
    extensionContext?.widgetLargestAvailableDisplayMode = .expanded
  }
    
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return words.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
    let word = words[indexPath.row]
    let split = word.components(separatedBy: "::")
    
    cell.selectedBackgroundView = UIView()
    cell.selectedBackgroundView!.backgroundColor = UIColor(white: 1, alpha: 0.20)
    cell.textLabel?.text = split[0]
    cell.detailTextLabel?.text = ""
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    
    if let cell = tableView.cellForRow(at: indexPath) {
      if cell.detailTextLabel?.text == "" {
        let word = words[indexPath.row]
        let split = word.components(separatedBy: "::")
        
        cell.detailTextLabel?.text = split[1]
      } else {
        cell.detailTextLabel?.text = ""
      }
    }
  }
  
  func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
      completionHandler(NCUpdateResult.newData)
  }
  
  func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
    if activeDisplayMode == .compact {
      preferredContentSize = CGSize(width: 0, height: 110)
    } else {
      preferredContentSize = CGSize(width: 0, height: 440)
    }
  }
    
}
