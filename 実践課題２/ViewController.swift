//
//  ViewController.swift
//  実践課題２
//
//  Created by dev室 インターン３ on 2018/11/07.
//  Copyright © 2018年 dev室 インターン３. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, XMLProcessProtocol {
    
    

    @IBOutlet weak var tableView: UITableView!

    let xml:XML = XML()
    var feedItems = [FeedItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        xml.delegateXML = self
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        
       
        
        tableView.register(UINib(nibName: "XMLTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        let xml: XML = XML()
        xml.loadXml()
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedItems.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! XMLTableViewCell
        let feedItem = feedItems
        let feedItemm = feedItem[indexPath.row]
        
        cell.titleLabel.text = feedItemm.title
        return cell

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let feedItemm = feedItems[indexPath.row]
        UIApplication.shared.open(URL(string: feedItemm.url)!, options: [:], completionHandler: nil)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // XMLパースが終了したので、あとはviewで表示の処理する
    func endParse() {
        self.tableView.reloadData()
        
    }
    

}

