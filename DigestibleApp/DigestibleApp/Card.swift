//
//  Card.swift
//  DigestibleApp
//
//  Created by Noel Thomas on 2020-08-20.
//  Copyright © 2020 Noel Thomas. All rights reserved.
//

import Foundation

struct Card {
    let prompt: String
    var answer: String
    
    static var example: Card{
        Card(prompt: "Who am I", answer: "Noel")
    }
}

