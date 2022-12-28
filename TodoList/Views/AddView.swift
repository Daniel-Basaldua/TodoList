//
//  AddView.swift
//  TodoList
//
//  Created by Daniel Basaldua on 12/26/22.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    @State var todoTextField: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Enter todo here...", text: $todoTextField, axis: .vertical)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color(red: 240/255, green: 240/255, blue: 240/255))
                    .cornerRadius(10)
                Button {
                    saveButtonPressed()
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
        .alert(alertTitle, isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        }
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: todoTextField)
            dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if todoTextField.count > 3 {
            return true
        } else {
            alertTitle = "Not enough characters"
            showAlert.toggle()
        }
        return false
    }
}

struct AddView_Previews: PreviewProvider {
    static let listViewModel = ListViewModel()
    static var previews: some View {
        NavigationView {
            AddView()
        }.environmentObject(listViewModel)
    }
}
