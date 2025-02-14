//
//  StockRow.swift
//  TastExchange
//
//  Created by Drew Cudmore on 2/14/25.
//


import SwiftUI

struct StockRow: View {
    let stock: Stock

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(stock.shortName)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(stock.name)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            
            // Trend Image (Placeholder)
            Image(stock.trendImage)
                .resizable()
                .frame(width: 50, height: 30)
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("$\(stock.price, specifier: "%.2f")")
                    .font(.headline)
                    .foregroundColor(.white)
                Text("\(stock.priceChange >= 0 ? "+" : "")\(stock.priceChange, specifier: "%.2f")%")
                    .padding(6)
                    .background(stock.priceChange >= 0 ? Color.green : Color.red)
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .font(.subheadline)
            }
        }
        .padding()
        .background(Color(.darkGray))
        .cornerRadius(10)
    }
}
