//
//  ItemTab.swift
//  threeTab
//
//  Created by f1235791 on 6/10/2023.
//

import SwiftUI

struct ItemTab: View {
    var body: some View {
        VStack{
            Text("Items")
                .fontWeight(.bold)
                .font(.title)
            List(Item.item) { item in
                HStack {
                    Text(item.title)
                }
            }
        }
    }
}


struct ItemTab_Previews: PreviewProvider {
    static var previews: some View {
        ItemTab()
    }
}

struct Item: Identifiable {
    let id: String
    let title: String

    static let item: [Item] = [
        Item(id: "Games", title: "Games"),
        Item(id: "Gifts", title: "Gifts"),
        Item(id: "Materials", title: "Materials"),
        Item(id: "Books", title: "Books")
    ]
}

