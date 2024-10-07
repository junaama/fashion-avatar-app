//
//  Outfit.swift
//  fashion-avatar
//
//  Created by macbook on 10/7/24.
//

import Foundation

struct Outfit: Identifiable {
    let id = UUID()
    let name: String
    let topIcon: String
    let bottomIcon: String
}
