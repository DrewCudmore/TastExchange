//
//  MockData.swift
//  TastExchange
//
//  Created by Drew Cudmore on 2/14/25.
//


import Foundation

struct MockData {
    static let sampleStocks: [Stock] = [
        Stock(name: "Sushi Palace", shortName: "SUSHI", price: 128.45, priceChange: 2.3, trendImage: "chart.line.uptrend.xyaxis"),
        Stock(name: "BBQ Haven", shortName: "BBQ", price: 76.12, priceChange: -1.8, trendImage: "chart.line.downtrend.xyaxis"),
        Stock(name: "Pasta Paradise", shortName: "PASTA", price: 93.50, priceChange: 0.7, trendImage: "chart.line.uptrend.xyaxis")
    ]
}
