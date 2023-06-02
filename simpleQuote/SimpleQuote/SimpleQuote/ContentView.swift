//
//  ContentView.swift
//  SimpleQuote
//
//  Created by Thebekhruz on 29/05/23.
//

import SwiftUI



struct ContentView: View {
    
    @State private var quote = "The only way to do great work is to love what you do. - Steve Jobs"
    @State private var animationTrigger = false

    var body: some View {
        NavigationView {
            ZStack {
                Color(.black)
                    .edgesIgnoringSafeArea(.all)
                VStack {

                    CardView(quote: quote)
                        .padding(.top, 50)
                                        
        
                    
                    Spacer()

                    NavigationLink(destination: ReadingListView()) {
                        Label("Reading List", systemImage: "book")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(20)
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 50)
                }
                .padding(.horizontal, 25)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


