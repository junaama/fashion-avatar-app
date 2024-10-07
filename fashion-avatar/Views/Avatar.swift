//
//  Avatar.swift
//  fashion-avatar
//
//  Created by macbook on 10/7/24.
//

import SwiftUI

struct Avatar: View {
    let topIcon: String
    let bottomIcon: String
    
    var body: some View {
        ZStack {
            Image(systemName: "person.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.gray)
            
            Image(systemName: topIcon)
                .resizable()
                .scaledToFit()
                .foregroundColor(.blue)
                .offset(y: -20)
            
            Image(systemName: bottomIcon)
                .resizable()
                .scaledToFit()
                .foregroundColor(.green)
                .offset(y: 40)
        }
        .frame(width: 150, height: 150)
    }
}

//#Preview {
//    Avatar()
//}
