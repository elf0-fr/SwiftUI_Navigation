//
//  CellModel.swift
//  SwiftUI_Navigation
//
//  Created by Elfo on 12/01/2025.
//

import SwiftUI

struct CellModel: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var description: String
    var color: Color
}

extension CellModel {
    static let sampleData: [CellModel] = [
        CellModel(title: "Blue", description: "Dark blue", color: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))),
        CellModel(title: "Blue", description: "The color of the sky", color: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))),
        CellModel(title: "Blue", description: "A beautiful blue: cyan", color: .cyan),
        CellModel(title: "Green", description: "Nature has a lot of green", color: .green),
        CellModel(title: "Red", description: "The super hero color", color: .red),
        CellModel(title: "Yellow", description: "Many flowers are yellow", color: .yellow),
        CellModel(title: "Orange", description: "The orange color", color: .orange),
        CellModel(title: "Black", description: "The black color", color: .black),
    ]
}
