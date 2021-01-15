//
//  Quote.swift
//  pensamentos
//
//  Created by Renan Rocha on 15/01/21.
//

import Foundation

struct Quote : Codable{
    
    var quote: String
    var author: String
    var image: String
    
    
    var FormaterQuote: String{
        return " '' " + quote + " '' "
    }
    
    var FormaterAuthor: String{
        return "- " + author + " -"
    }
    
}
