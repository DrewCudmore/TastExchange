//
//  RestaurantStock.swift
//  TastExchange
//
//  Created by Drew Cudmore on 2/14/25.
//

import Foundation


struct RestaurantStock: Identifiable, Codable {
    let id = UUID()
    let name: String
    let shortName: String
    let price: Double
    let priceChange: Double // Percentage change
    let trendImage: String // Placeholder for trend graph (can be SF Symbol or image)
}
