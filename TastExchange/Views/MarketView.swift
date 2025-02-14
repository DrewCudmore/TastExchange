//
//  MarketView.swift
//  TastExchange
//
//  Created by Drew Cudmore on 2/14/25.
//

import SwiftUI

struct MarketView: View {
    @StateObject var apiService = APIService()

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(apiService.stocks) { stock in
                        StockRow(stock: stock)
                    }
                }
                .padding()
            }
            .navigationTitle("Market")
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
    }
}
