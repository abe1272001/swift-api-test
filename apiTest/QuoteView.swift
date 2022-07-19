//
//  QuoteView.swift
//  apiTest
//
//  Created by abe chen on 2022/7/19.
//

import SwiftUI

struct QuoteView: View {
    var quote: Quote
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(quote.author)
                .font(.largeTitle)
                .padding(.bottom, 16)
            Text(quote.series)
                .padding(.bottom, 8)
            Text(quote.quote)
                .font(.body)
        }
        .padding()
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView(quote: Quote(quote_id: 1, quote: "WTF Are you doing???????????", author: "John Snow", series: "Hamburger"))
    }
}
