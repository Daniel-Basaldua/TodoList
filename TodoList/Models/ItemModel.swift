//
//  ItemModel.swift
//  TodoList
//
//  Created by Daniel Basaldua on 12/26/22.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    let id: UUID
    let title: String
    let isCompleted: Bool
    
    init(id: UUID = UUID(), title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: self.id, title: self.title, isCompleted: !self.isCompleted)
    }
}
