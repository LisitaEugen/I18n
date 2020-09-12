//
//  ContentView.swift
//  I18nApp
//
//  Created by Evgheni Lisita on 12.09.20.
//  Copyright © 2020 Evgheni Lisita. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: I18nViewModel

    var body: some View {
        TabView(selection: $viewModel.selectedTab) {
            I18nView()
            .tabItem {
                Image(systemName: "book")
                Text("EN")
            }
            .tag(0)
            I18nView()
            .tabItem {
                Image(systemName: "book")
                Text("RU")
            }
            .tag(1)
            I18nView()
            .tabItem {
                Image(systemName: "book")
                Text("JP")
            }
            .tag(2)
        }
    }
}

struct I18nView: View {
    @EnvironmentObject var viewModel: I18nViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            Text("Number: \(viewModel.formattedNumber ?? "")")
            Text("Currency: \(viewModel.formattedPrice ?? "")")
            Text("Date: \(viewModel.formattedDate ?? "")")
            Text("Pressure: \(viewModel.formattedPressure ?? "")")
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(I18nViewModel())
    }
}
