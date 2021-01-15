//
//  QuotesManager.swift
//  pensamentos
//
//  Created by Renan Rocha on 15/01/21.
//

import Foundation

class QuotesManager{
    
    let quotes: [Quote]
    
    init() {
        
        var file = Bundle.main.url(forResource: "quotes", withExtension: ".json")
        var jsonData = try! Data(contentsOf: file!)
        var jsonDecode = JSONDecoder()
        quotes = try! jsonDecode.decode([Quote].self, from: jsonData)
    }
    
    func getRandonQuote() -> Quote{
        
        let index = Int(arc4random_uniform(UInt32(quotes.count)))
        return quotes[index]
        
    }
    
}
