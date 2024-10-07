//
//  ContentView.swift
//  fashion-avatar
//
//  Created by macbook on 10/7/24.
//

import SwiftUI

struct ContentView: View {
    @State private var outfits = [
        Outfit(name: "Casual", topIcon: "tshirt", bottomIcon: "bag"),
        Outfit(name: "Formal", topIcon: "suit.fill", bottomIcon: "briefcase"),
        Outfit(name: "Sporty", topIcon: "figure.walk", bottomIcon: "figure.walk"),
    ]
    @State private var showingNewOutfit = false
    @State private var selectedOutfit: Outfit?
    @State private var rotationAngle: Double = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Avatar(topIcon: selectedOutfit?.topIcon ?? "person.fill",
                       bottomIcon: selectedOutfit?.bottomIcon ?? "person.fill")
                    .rotationEffect(.degrees(rotationAngle))
                    .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0), value: rotationAngle)
                
                
                
                List(outfits) { outfit in
                    HStack {
                        Text(outfit.name)
                        Spacer()
                        Image(systemName: outfit.topIcon)
                        Image(systemName: outfit.bottomIcon)
                    }
                    .onTapGesture {
                        changeOutfit(to: outfit)
                    }
                }
                .listStyle(InsetGroupedListStyle())
                
                Button(action: {
                    showingNewOutfit = true
                }) {
                    Label("Add New Outfit", systemImage: "plus")
                }
                .padding()
            }
            .navigationTitle("Your Closet")
            .sheet(isPresented: $showingNewOutfit) {
                NewOutfitView(outfits: $outfits)
            }
        }
    }
    
    func changeOutfit(to outfit: Outfit) {
        withAnimation {
            rotationAngle += 360
            selectedOutfit = outfit
        }
    }
}


#Preview {
    ContentView()
}
