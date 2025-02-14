//
//  TastExchangeApp.swift
//  TastExchange
//
//  Created by Drew Cudmore on 2/14/25.
//

import SwiftUI

@main
struct TastExchangeApp: App {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UITabBar.appearance().barTintColor = UIColor.black
        UITabBar.appearance().backgroundColor = UIColor.black
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
    }
    
    var body: some Scene {
        WindowGroup {
            MarketView()
        }
    }
}
