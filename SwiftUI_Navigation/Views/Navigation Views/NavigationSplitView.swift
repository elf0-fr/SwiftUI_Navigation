//
//  NavigationSplitView.swift
//  SwiftUI_Navigation
//
//  Created by Elfo on 16/01/2025.
//

import SwiftUI

struct NavigationWithNavigationSplitView: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    @State private var selectedCellId: CellModel.ID?
    
    var body: some View {
        NavigationSplitView {
            List(selection: $selectedCellId) {
                ForEach(data.cells) { cell in
                    Cell(cell: cell)
                }
            }
        } detail: {
            if let selectedCellId, let cell = data.cells.first(where: { $0.id == selectedCellId }) {
                CellDetail(cell: cell)
            } else {
                Text("Select a cell")
            }
        }
    }
}

struct NavigationWithNavigationSplitViewWithNavigationInSidebar: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    @State private var selectedCellId: CellModel.ID?
    
    var body: some View {
        NavigationSplitView {
            NavigationStack {
                List(data.cells, selection: $selectedCellId) { cell in
                    Cell(cell: cell)
                }
                .toolbar {
                    NavigationLink(value: "Settings") {
                        Label("Settings", systemImage: "gear")
                    }
//                    .isDetailLink(false)
                }
                .navigationDestination(for: String.self) { _ in
                    Text("Settings")
                }
            }
        } detail: {
            if let selectedCellId, let cell = data.cells.first(where: { $0.id == selectedCellId }) {
                CellDetail(cell: cell)
            } else {
                Text("Select a cell")
            }
        }
    }
}

struct NavigationWithNavigationSplitViewWithContent: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    @State private var selectedColor: String?
    @State private var selectedCell: CellModel?
    
    var listCells: [CellModel] {
        let list = data.cells.filter { $0.title == selectedColor }
        return list.sorted { $0.description < $1.description }
    }
    
    var body: some View {
        NavigationSplitView {
            List(selection: $selectedColor) {
                ForEach(data.colorList, id: \.self) { color in
                    Text(color)
                }
            }
            .listStyle(.sidebar) // I don't see the difference here.
            .navigationTitle("Colors")
        } content: {
            List(selection: $selectedCell) {
                ForEach(listCells) { cell in
                    NavigationLink(value: cell) {
                        Cell(cell: cell)
                    }
                }
            }
            .listStyle(.grouped)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(selectedColor ?? "Select a color")
        } detail: {
            if let selectedCell {
                CellDetail(cell: selectedCell)
            } else {
                Text("Select a color and a cell")
            }
        }
    }
}

struct NavigationWithNavigationSplitViewWithConfiguration: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    @State private var selectedColor: String?
    @State private var selectedCell: CellModel?
    @State private var visibility: NavigationSplitViewVisibility = .automatic
    
    var listCells: [CellModel] {
        let list = data.cells.filter { $0.title == selectedColor }
        return list.sorted { $0.description < $1.description }
    }
    
    var sidebar: some View {
        List(selection: $selectedColor) {
            ForEach(data.colorList, id: \.self) { color in
                Text(color)
            }
        }
        .listStyle(.sidebar) // I don't see the difference here.
        .navigationTitle("Colors")
    }
    
    var content: some View {
        List(selection: $selectedCell) {
            ForEach(listCells) { cell in
                NavigationLink(value: cell) {
                    Cell(cell: cell)
                }
            }
        }
        .listStyle(.grouped)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(selectedColor ?? "Select a color")
    }

    @ViewBuilder
    var detail: some View {
        if let selectedCell {
            CellDetail(cell: selectedCell)
        } else {
            Text("Select a color and a cell")
        }
    }
    
    var body: some View {
        NavigationSplitView(columnVisibility: $visibility) {
            sidebar
                .navigationSplitViewColumnWidth(200)
        } content: {
            content
        } detail: {
            detail
        }
        .navigationSplitViewStyle(.prominentDetail)
        .onChange(of: selectedCell, initial: false) { _, _ in
            visibility = .detailOnly
        }
    }
}

#Preview("Sidebar and detail") {
    NavigationWithNavigationSplitView()
}

#Preview("Sidebar navigation") {
    NavigationWithNavigationSplitViewWithNavigationInSidebar()
}

#Preview("With content") {
    NavigationWithNavigationSplitViewWithContent()
}

#Preview("With configuration") {
    NavigationWithNavigationSplitViewWithConfiguration()
}
