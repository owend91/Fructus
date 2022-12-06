//
//  OnboardingView.swift
//  Fructus
//
//  Created by David Owen on 12/5/22.
//

import SwiftUI

struct OnboardingView: View {
    //MARK: - Properties
    var fruits: [Fruit] = fruitsData
    
    //MARK: - Body
    var body: some View {
        TabView {
            ForEach(fruits[0...5]) {fruit in
                FruitCardView(fruit: fruit)
            } //: Loop
        } //: Tab
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}

//MARK: - Preview
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
