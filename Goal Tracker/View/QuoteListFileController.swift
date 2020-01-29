//
//  QuoteListFileController.swift
//  Goal Tracker
//
//  Created by Jared Detro on 1/24/20.
//  Copyright © 2020 Damian Lopez. All rights reserved.
//
//  NSUserDefaults

import Foundation

class QuoteListFileController {
    let session = URLSession.shared
    let decoder = JSONDecoder()
    
    func getQuoteList(completion: @escaping (Result<[Quote], QuoteListError>) -> Void) {
        let url = Bundle.main.url(forResource: "Quotes", withExtension: "json")!
        if let data = try? Data(contentsOf: url) {
            do {
                let quoteList = try decoder.decode(QuoteListItem.self, from: data)
                completion(.success(quoteList.results))
            } catch {
                print(error)
                completion(.failure(.failed))
            }
        }
    }
}

enum QuoteListError: Error {
    case failed
}
