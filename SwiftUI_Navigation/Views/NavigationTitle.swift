//
//  NavigationTitle.swift
//  SwiftUI_Navigation
//
//  Created by Elfo on 12/01/2025.
//

import SwiftUI

struct NavigationTitle: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    @State private var isLarge = true
    
    var body: some View {
        NavigationStack {
            List {
                Toggle("Large Title", isOn: $isLarge)
                
                ForEach(data.cells) { cell in
                    Cell(cell: cell)
                }
            }
            .navigationTitle("My Navigation Title")
            .navigationBarTitleDisplayMode(isLarge ? .large : .inline)
        }
    }
}

struct NavigationTitleRename: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    
    var body: some View {
        let cell = data.cells[0]
        NavigationStack {
            CellDetail(cell: cell)
                .ignoresSafeArea(edges: .bottom)
                .navigationTitle($data.cells[0].title)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NavigationTitle()
}

#Preview("Renaming") {
    NavigationTitleRename()
}
