//
//  ContentView.swift
//  FRUCTUS
//
//  Created by JJ Santos on 02/06/21.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    
    var fruits: [Fruit] = fruitsData
    
    @State private var isShowingSettings: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(fruits.shuffled()) { item in
                    NavigationLink(destination: FruitDetailView(fruit: item)) {
                        FruitRowView(fruit: item)
                            .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("Fruits")
            .navigationBarItems(
                trailing:
                    Button(action: {
                        isShowingSettings = true
                    }) {
                        Image(systemName: "slider.horizontal.3")
                    } //: BUTTON
                    .sheet(isPresented: $isShowingSettings) {
                        SettingsView()
                    }
            )
        } //: NAVIGATION
        // NO SIDEBARS AND SLIDING PANELS ON THE RIGHT SCREEN
        .navigationViewStyle(StackNavigationViewStyle())
            
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitsData)
    }
}
