//
//  ItemModel.swift
//  TodoList
//
//  Created by Daniel Basaldua on 12/26/22.
//

import Foundation

struct ItemModel: Identifiable {
    let id = UUID()
    let title: String
    let isCompleted: Bool
}
