//
//  ListViewModel.swift
//  TodoList
//
//  Created by Daniel Basaldua on 12/27/22.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func getItems() {
        let newItems: [ItemModel] = [
            ItemModel(title: "TEMP_1", isCompleted: false),
            ItemModel(title: "TEMP_2", isCompleted: true),
            ItemModel(title: "TEMP_3", isCompleted: false)
        ]
        items.append(contentsOf: newItems)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: {
            return $0.id == item.id
        }) {
            items[index] = item.updateCompletion()
        }
    }
}
