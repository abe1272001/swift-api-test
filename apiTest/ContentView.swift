//
//  ContentView.swift
//  apiTest
//
//  Created by abe chen on 2022/7/19.
//

import SwiftUI

struct Quote: Codable {
    var quote_id: Int
    var quote: String
    var author: String
    var series: String
}


struct ContentView: View {
    
    @State private var quotes = [Quote]()
    
    var body: some View {
        NavigationView {
            
            List(quotes, id: \.quote_id) { quote in
                ZStack {
                    NavigationLink(destination: QuoteView(quote: quote)) {
                        VStack(alignment: .leading) {
                            Text(quote.author)
                                .font(.headline)
                                .foregroundColor(Color("skyBlue"))
                                .padding(.bottom, 5)
                            
                            Text(quote.quote)
                                .font(.body)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Quotes")
            .task {
                await fetchDate()
            }
        }
    }
    
    func fetchDate() async {
        // create url
        guard let url = URL(string: "https://www.breakingbadapi.com/api/quotes") else {
            print("Hey man THIS URL DOES NOT WORK :(")
            return
        }
        //fetch data from url
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            //decode that data
            if let decodedResponse = try? JSONDecoder().decode([Quote].self, from: data) {
                quotes = decodedResponse
                print(quotes)
            }
        } catch {
            print("Bad News... this data isn't valid :(")
        }
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
