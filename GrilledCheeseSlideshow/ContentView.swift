//
//  ContentView.swift
//  GrilledCheeseSlideshow
//
//  Created by PM Student on 10/21/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var selected = 0
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Grilled Cheese")
                .font(.system(size: 40))
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
                .padding(.top, 50)
            
            TabView(selection: $selected) {
                ForEach(1...4, id: \.self) { index in
                    
                    ZStack {
                        
                        // loads the images
                        GeometryReader { reader in
                            Image("p\(index)")
                                .resizable()
                                .frame(width: 400, height: 400)
                                .aspectRatio(contentMode: .fill)
                            // adjusts the views horizontal position based on the frames offset. gives us the carousel effect
                                .offset(x: -reader.frame(in: .global).minX)
                            
                        }
                        .frame(height: 400.0)
                        .cornerRadius(15)
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(15)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: -5, y: 5)
                        .padding(.horizontal, 25)
                        
                        Image("tiny")
                            .resizable()
                            .background(Color.white)
                            .cornerRadius(15)
                            .frame(width: 40, height: 40)
                            .position(x: 360, y: 490)
                            
                    }
                }
                .padding(.bottom, 80)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

#Preview {
    ContentView()
}
