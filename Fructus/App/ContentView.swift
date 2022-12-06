//
//  ContentView.swift
//  Fructus
//
//  Created by David Owen on 12/5/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingSettings: Bool = false
    var fruits: [Fruit] = fruitsData
    var body: some View {
        NavigationView {
            List{
                ForEach(fruits.shuffled()) { item in
                    NavigationLink(destination: FruitDetailView(fruit: item)) {
                        FruitRowView(fruit: item)
                            .padding(.vertical, 4)
                    }
                }
                .navigationTitle("Fruits")
            }
            .toolbar {
                Button {
                    isShowingSettings.toggle()
                } label: {
                    Image(systemName: "slider.horizontal.3")
                }
            }
            .navigationViewStyle(.stack)
        }
        .sheet(isPresented: $isShowingSettings) {
            SettingsView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
