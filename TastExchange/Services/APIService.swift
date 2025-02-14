//
//  RestaurantStock.swift
//  TastExchange
//
//  Created by Drew Cudmore on 2/14/25.
//


import Foundation

import Foundation

class APIService: ObservableObject {
    @Published var stocks: [RestaurantStock] = []
    var timer: Timer?

    init() {
        startFetchingStocks()
    }

    func startFetchingStocks() {
        // Start a timer that calls fetchStocks every 1 second
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.fetchStocks()
        }
    }

    func stopFetchingStocks() {
        timer?.invalidate() // Stop the timer when you don't need it anymore
    }

    func fetchStocks() {
        guard let url = URL(string: "http://127.0.0.1:5000/stocks") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    do {
                        print("Hit API")
                        self.stocks = try JSONDecoder().decode([RestaurantStock].self, from: data)
                    } catch {
                        print("Decoding error: \(error)")
                    }
                }
            }
        }.resume()
    }
}
