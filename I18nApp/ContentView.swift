//
//  ContentView.swift
//  I18nApp
//
//  Created by Evgheni Lisita on 12.09.20.
//  Copyright © 2020 Evgheni Lisita. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab = 1
    var body: some View {
        TabView(selection: $selectedTab) {
            I18nView(locale: "en_US")
            .tabItem {
                Image(systemName: "book")
                Text("RU")
            }
            I18nView(locale: "en_US")
            .tabItem {
                Image(systemName: "book")
                Text("EN")
            }
            I18nView(locale: "ja_JP")
            .tabItem {
                Image(systemName: "book")
                Text("JP")
            }
        }
    }
}

struct I18nView: View {
    var locale: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            Text("Date")
            Text("Number")
            Text("Speed")
            Text("Currency")
            Spacer()
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
