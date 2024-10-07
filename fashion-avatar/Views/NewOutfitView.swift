//
//  NewOutfitView.swift
//  fashion-avatar
//
//  Created by macbook on 10/7/24.
//

import SwiftUI

struct NewOutfitView: View {
    @Binding var outfits: [Outfit]
    @State private var outfitName = ""
    @State private var topIcon = "tshirt"
    @State private var bottomIcon = "bag"
    @Environment(\.presentationMode) var presentationMode
    
    let iconOptions = ["tshirt", "suit.fill", "figure.walk", "bag", "briefcase"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Outfit Name", text: $outfitName)
                
                Picker("Top", selection: $topIcon) {
                    ForEach(iconOptions, id: \.self) { icon in
                        Image(systemName: icon).tag(icon)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                Picker("Bottom", selection: $bottomIcon) {
                    ForEach(iconOptions, id: \.self) { icon in
                        Image(systemName: icon).tag(icon)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .navigationTitle("New Outfit")
            .navigationBarItems(trailing: Button("Save") {
                let newOutfit = Outfit(name: outfitName, topIcon: topIcon, bottomIcon: bottomIcon)
                outfits.append(newOutfit)
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

//
//#Preview {
//    NewOutfitView([
//        Outfit(name: "Casual", image: "tshirt"),
//        Outfit(name: "Formal", image: "suit"),
//        Outfit(name: "Sporty", image: "figure.run"),
//    ])
//}
