//
//  ApplicationData.swift
//  SwiftUI_Navigation
//
//  Created by Elfo on 12/01/2025.
//

import SwiftUI
import Observation

@Observable class ApplicationData {
    
    var cells: [CellModel] {
        didSet {
            updateColorList();
        }
    }
    var colorList: [String] = []
    
    func updateColorList() {
        var list: [String] = []
        for cell in cells {
            if !list.contains(cell.title) {
                list.append(cell.title)
            }
        }
        self.colorList = list.sorted(by: { $0.description < $1.description })
    }

    init(cells: [CellModel]) {
        self.cells = cells
        // updateColorList is not called from the didSet on the init.
        updateColorList()
    }
}
