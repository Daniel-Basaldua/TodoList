//
//  ContentView.swift
//  TodoList
//
//  Created by Daniel Basaldua on 12/26/22.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [String] = [
        "TEMP_1", "TEMP_2", "TEMP_3"
    ]
    
    var body: some View {
        List {
            ForEach(items, id: \.self) {
                ListRowView(title: $0)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Todo List 📝")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Add") {
                    AddView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}
