//
//  ItemView.swift
//  threeTab
//
//  Created by f1235791 on 6/10/2023.
//

import SwiftUI

struct ItemView: View {
    @State private var news: [News] = []
    
    var body: some View {
        List(news) { newsItem in
            AsyncImage(url: URL(string: newsItem.image)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .scaledToFit()
            Text(newsItem.title)
        }
        .onAppear(perform: startLoad)
        .refreshable {
            startLoad()
        }
    }
}
struct News: Decodable {
    let _id: Int
    let title: String
    let description: String
    let image: String
    let category: String
    let location: String
    let remark: String
}
extension ItemView {
    
    func handleClientError(_ error: Error) {
        // Handle the client-side error here
        print("Client Error: \(error)")
        // Additional error handling logic can be implemented
        // For example, displaying an error message to the user
    }
    
    func handleServerError(_ response: URLResponse?) {
        // Handle the server-side error here
        if let httpResponse = response as? HTTPURLResponse {
            print("Server Error: Status Code \(httpResponse.statusCode)")
            // Additional error handling logic can be implemented
            // For example, checking the status code and displaying an appropriate error message to the user
        }
    }
    
    func startLoad() {
        print("startLoad")
        let url = URL(string: "https://comp4107.azurewebsites.net/inventory?")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                self.handleClientError(error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                self.handleServerError(response)
                return
            }
            
            if let mimeType = httpResponse.mimeType, mimeType == "application/json",
               let data = data,
               let news = try? JSONDecoder().decode([News].self, from: data) {
               
                self.news = news
               }
            }
            
        task.resume()
    }
}
//extension News: Decodable {}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView()
    }
}
