//
//  QuoteModel.swift
//  Goal Tracker
//
//  Created by Jared Detro on 1/21/20.
//  Copyright © 2020 Damian Lopez. All rights reserved.
//

import Foundation

struct Quote: Codable {
    let text: String
    let author: String?
}

struct QuoteListItem: Codable {
    let results: [Quote]
}
