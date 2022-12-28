//
//  ContentView.swift
//  TodoList
//
//  Created by Daniel Basaldua on 12/26/22.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        List {
            ForEach(listViewModel.items, id: \.id) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear(duration: 0.1)) {
                            listViewModel.updateItem(item: item)
                        }
                    }
            }
            .onDelete { indexSet in
                listViewModel.deleteItem(indexSet: indexSet)
            }
            .onMove { IndexSet, newOffset in
                listViewModel.moveItem(from: IndexSet, to: newOffset)
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
    static let listViewModel = ListViewModel()
    static var previews: some View {
        NavigationView {
            ListView()
        }.environmentObject(listViewModel)
    }
}
