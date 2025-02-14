//
//  ContentView.swift
//  TastExchange
//
//  Created by Drew Cudmore on 2/14/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MarketView()
                .tabItem {
                    Label("Market", systemImage: "chart.bar.fill")
                }

            PortfolioView()
                .tabItem {
                    Label("Portfolio", systemImage: "briefcase.fill")
                }

            LeaderboardView()
                .tabItem {
                    Label("Leaderboard", systemImage: "trophy.fill")
                }

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
