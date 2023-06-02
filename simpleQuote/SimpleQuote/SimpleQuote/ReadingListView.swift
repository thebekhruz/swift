//
//  ReadingListView.swift
//  SimpleQuote
//
//  Created by Thebekhruz on 30/05/23.
//

import Foundation
import SwiftUI

struct Book: Identifiable, Codable {
    var id = UUID()
    var title: String
}

struct ReadingListView: View {
    @AppStorage("books") private var booksData: Data = Data()
    @State private var books = [Book]()
    @State private var newBookTitle = ""

    var body: some View {
        
        VStack {
            
            TextField("New book title", text: $newBookTitle, onCommit: {
                if !newBookTitle.isEmpty {
                    let newBook = Book(title: newBookTitle)
                    books.append(newBook)
                    saveBooks()
                    newBookTitle = ""
                }
            })
            .textFieldStyle(.roundedBorder)
            .foregroundColor(.black)


            List {
                ForEach(books) { book in
                    Text(book.title)
                        .foregroundColor(.white)

                }
                .onDelete(perform: deleteBook)
            }
            .listStyle(.plain)
            .background(Color.black)
        }
        background(Color.black.edgesIgnoringSafeArea(.all))
            .navigationTitle("Reading List")
            .navigationBarTitleDisplayMode(.automatic)
            .navigationBarItems(trailing: EditButton())
            .onAppear(perform: loadBooks)
    }

    func deleteBook(at offsets: IndexSet) {
        books.remove(atOffsets: offsets)
        saveBooks()
    }

    func saveBooks() {
        if let encodedData = try? JSONEncoder().encode(books) {
            booksData = encodedData
        }
    }

    func loadBooks() {
        if let decodedBooks = try? JSONDecoder().decode([Book].self, from: booksData) {
            books = decodedBooks
        }
    }
}

struct ReadingListView_Previews: PreviewProvider {
    static var previews: some View {
        ReadingListView()
    }
}


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
