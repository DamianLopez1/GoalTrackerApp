//
//  QuoteViewController.swift
//  Goal Tracker
//
//  Created by Damian Lopez on 1/17/20.
//  Copyright © 2020 Damian Lopez. All rights reserved.
//
// Jared wuz here🐵

import UIKit

class QuoteViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    let networkController = QuoteListFileController()
    let currentQuoteIndexKey = "currentQuoteIndex"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        networkController.getQuoteList { result in
            switch result {
            case .success( let quotes):
                let defaults = UserDefaults.standard
                var currentIndex = defaults.integer(forKey: self.currentQuoteIndexKey)
                if currentIndex >= quotes.count {
                    currentIndex = 0
                }
                DispatchQueue.main.async {
                    self.displayQuote(quote: quotes[currentIndex])
                    defaults.set(currentIndex + 1, forKey: self.currentQuoteIndexKey)
                }
                
            case .failure(let error):
                print(error)
            }
        }
        
    }
    

    func displayQuote(quote: Quote) {
        quoteLabel.text = quote.text
        authorLabel.text = quote.author
    }
}
