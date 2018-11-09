//
//  DelegateTableView.swift
//  実践課題２
//
//  Created by dev室 インターン３ on 2018/11/07.
//  Copyright © 2018年 dev室 インターン３. All rights reserved.
//

import Foundation
import UIKit

class DelegateTableView: UITableView, UITableViewDelegate,UITableViewDataSource, XMLProcessProtocol {

    
    let xml:XML = XML()
    var 
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return xml.feedItems.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! XMLTableViewCell
        let feedItem = xml.feedItems
        let feedItemm = feedItem[indexPath.row]
        
        cell.titleLabel.text = feedItemm.title
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let feedItem = xml.feedItems
        let feedItemm = feedItem[indexPath.row]
        UIApplication.shared.open(URL(string: feedItemm.url)!, options: [:], completionHandler: nil)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func endParse() {
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
