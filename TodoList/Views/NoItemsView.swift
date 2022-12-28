//
//  NoItemsView.swift
//  TodoList
//
//  Created by Daniel Basaldua on 12/27/22.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        VStack {
            Text("There are no items")
                .font(.title)
                .fontWeight(.semibold)
            Text("Click the add button to begin adding todo items.")
                .padding(.bottom, 20)
            NavigationLink {
                AddView()
            } label: {
                Text("Add first item")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(animate ? secondaryAccentColor : Color.accentColor)
                    .cornerRadius(10)
            }
            .padding(.horizontal, animate ? 30 : 50)
            .shadow(color: animate ? secondaryAccentColor : .accentColor, radius: 10, x: 0, y: 0)
            .scaleEffect(animate ? 1.1 : 1.0)
            .offset(y: animate ? -7 : 0)
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(40)
        .frame(maxWidth: .infinity)
        .onAppear {
            addAnimation()
        }
    }
    
    func addAnimation() {
        guard !animate else {return}//prevents the animation from stopping
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(Animation.easeInOut(duration: 2.0).repeatForever()) {
                animate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
                .navigationTitle("ToDo")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
