//
//  ListRowView.swift
//  TodoList
//
//  Created by Daniel Basaldua on 12/26/22.
//

import SwiftUI

// NOT an extension of the listView because the data is different everytime.
struct ListRowView: View {
    
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
            Text(title)
            Spacer()
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(title: "TEMP").previewLayout(.sizeThatFits)
    }
}
