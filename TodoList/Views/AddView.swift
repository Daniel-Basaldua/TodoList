//
//  AddView.swift
//  TodoList
//
//  Created by Daniel Basaldua on 12/26/22.
//

import SwiftUI

struct AddView: View {
    
    @State var todoTextField: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Enter todo here...", text: $todoTextField, axis: .vertical)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color(red: 240/255, green: 240/255, blue: 240/255))
                    .cornerRadius(10)
                Button {
                    //
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }

            }.padding(10)
        }
        .navigationTitle("Add an Item ✏️")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
    }
}
