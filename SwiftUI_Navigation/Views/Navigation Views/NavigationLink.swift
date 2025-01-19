//
//  NavigationLink.swift
//  SwiftUI_Navigation
//
//  Created by Elfo on 12/01/2025.
//

import SwiftUI

struct NavigationWithNavigationLink: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(data.cells) { cell in
                    NavigationLink(destination: Text(cell.title)) {
                        Cell(cell: cell)
                    }
                }
            }
        }
    }
}

/// Prefer using navigationDestination in list to avoir loading destination for each row.
struct NavigationWithNavigationLinkAndDestination: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Settings", value: "settings")
                
                ForEach(data.cells) { cell in
                    // CellModel has to be Hashable
                    NavigationLink(value: cell) {
                        Cell(cell: cell)
                    }
                }
            }
            .navigationDestination(for: CellModel.self) { cell in
                CellDetail(cell: cell)
                    .ignoresSafeArea(edges: .bottom)
            }
            .navigationDestination(for: String.self) { id in
                if id == "settings" {
                    Text("Settings")
                } else {
                    Text("Unknown")
                }
            }
        }
    }
}

struct NavigationWithNavigationPath: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    /// Path is usually stored in the ApplicationData.
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(data.cells) { cell in
                    NavigationLink(value: cell) {
                        Cell(cell: cell)
                    }
                }
            }
            .navigationDestination(for: CellModel.self) { cell in
                Text("cell: \(cell.title)")
            }
            .navigationDestination(for: String.self) { id in
                if id == "settings" {
                    Text("Settings")
                } else {
                    Text("Unknown")
                }
            }
            .toolbar {
                Button("Push Hello") {
                    path.append("Hello")
                }
            }
        }
    }
}

#Preview {
    NavigationWithNavigationLink()
}

#Preview("With navigation destination") {
    NavigationWithNavigationLinkAndDestination()
}

#Preview("With navigation path") {
    NavigationWithNavigationPath()
}
