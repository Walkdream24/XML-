//
//  XML.swift
//  実践課題２
//
//  Created by dev室 インターン３ on 2018/11/07.
//  Copyright © 2018年 dev室 インターン３. All rights reserved.
//

import UIKit

protocol XMLProcessProtocol: class{
    
    // TODO
    // PARSEされたものをviewcontrollerに返すために、引数に結果を渡さないといけない
    // 上記を追加で修正する必要あり
    var feedItems: [FeedItem] { get set }
    
    func endParse()
}

class XML: NSObject, XMLParserDelegate {
    
    weak var delegateXML: XMLProcessProtocol?
    
    var currentElementName: String = ""
    
    let ITEM_ELEMENT_NAME = "item"
    let TITLE_ELEMENT_NAME = "title"
    let LINK_ELEMENT_NAME = "link"
    
    
    
    func loadXml() {
        let urlString = "https://www.wantedly.com/projects.xml"
        
        guard let url = NSURL(string: urlString) else {
            return
        }
        
        guard let parser = XMLParser(contentsOf: url as URL) else {
            return
        }
        parser.delegate = self
        parser.parse()
    }
    
    
    // 解析中に要素の開始タグがあったときに実行されるメソッド
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
        if elementName == ITEM_ELEMENT_NAME {
            delegateXML?.feedItems.append(FeedItem())
        } else {
            currentElementName = elementName
        }
        print("開始タグ:" + elementName)
    }
    
    // 開始タグと終了タグでくくられたデータがあったときに実行されるメソッド
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let count = delegateXML?.feedItems.count ?? 0
        if  count > 0 {
            let lastItem = delegateXML?.feedItems[count - 1]
            switch self.currentElementName {
            case TITLE_ELEMENT_NAME:
                let tmpString = lastItem?.title ?? ""
                lastItem?.title = (tmpString != nil) ? tmpString + string : string
                
            case LINK_ELEMENT_NAME:
                lastItem?.url = string
            default: break
            }
        }
        print("要素:" + string)
        
        
    }
    
    // 解析中に要素の終了タグがあったときに実行されるメソッド
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        self.currentElementName = ""
        print("終了タグ:" + elementName)
    }

    // XML解析終了時に実行されるメソッド
    func parserDidEndDocument(_ parser: XMLParser) {
        delegateXML?.endParse()
        print("XML解析終了しました")
        //print(parser.)
        // virwcontrollerに終了したことを通知
    }
    
    
}
