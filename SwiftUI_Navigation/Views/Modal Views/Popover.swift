//
//  Popover.swift
//  SwiftUI_Navigation
//
//  Created by Elfo on 16/01/2025.
//

import SwiftUI

struct Popover: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    @State private var showPopover1: Bool = false
    @State private var showPopover2: Bool = false
    @State private var firstCell: CellModel?
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 15) {
                Button("Popover") {
                    showPopover1 = true
                }
                .popover(isPresented: $showPopover1) {
                    PopoverView()
                }
                
                Button("Popover") {
                    showPopover2 = true
                }
                .popover(isPresented: $showPopover2, arrowEdge: .leading) {
                    PopoverView()
                }
                
                Button("Show First Cell") {
                    firstCell = data.cells.first
                }
                .popover(item: $firstCell) { cell in
                    Cell(cell: cell)
                }
            }
        }
    }
}

struct PopoverView: View {
    var body: some View {
        Text("Popover")
            .padding()
            .background {
                Color.cyan
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            }
            .padding()
    }
}

#Preview {
    Popover()
}
