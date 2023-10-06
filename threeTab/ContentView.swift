//
//  ContentView.swift
//  threeTab
//
//  Created by f1235791 on 6/10/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ItemTab().tabItem {
                Text("Item")
            }
            SearchTab().tabItem {
                Text("Search")
            }
            LoginTab().tabItem {
                Text("Login")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
