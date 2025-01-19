//
//  Sheet.swift
//  SwiftUI_Navigation
//
//  Created by Elfo on 15/01/2025.
//

import SwiftUI

struct Sheet: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    @State private var showSheet = false
    @State private var newCell = CellModel(title: "", description: "", color: .blue)
    @State private var selectedCell: CellModel?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(data.cells) { cell in
                    Cell(cell: cell)
                        .onTapGesture {
                            selectedCell = cell
                        }
                }
            }
            .toolbar {
                Button {
                    showSheet = true
                } label: {
                    Label("Add Cell", systemImage: "plus")
                }

            }
            .sheet(isPresented: $showSheet) {
                newCell = CellModel(title: "", description: "", color: .blue)
            } content: {
                NavigationStack {
                    CellForm(cell: $newCell, isNew: true)
                        .environment(data)
                }
                .interactiveDismissDisabled()
            }
            .sheet(item: $selectedCell) { cell in
                NavigationStack {
                    Form {
                        LabeledContent("Title:", value: "\(cell.title)")
                        LabeledContent("Description:", value: "\(cell.description)")
                        LabeledContent("Color:") {
                            cell.color
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                .frame(width: 100)
                        }
                    }
                }
            }
        }
    }
}

struct CellForm: View {
    
    @Binding var cell: CellModel
    var isNew: Bool
    
    @Environment(\.dismiss) private var dismiss
    @Environment(ApplicationData.self) private var data
    
    var body: some View {
        Form {
            TextField("Title", text: $cell.title)
            TextField("Description", text: $cell.description)
            ColorPicker("Color", selection: $cell.color)
        }
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .confirmationAction) {
                Button(isNew ? "Add" : "Update") {
                    if isNew {
                        data.cells.append(cell)
                    } else {
                        
                    }
                    dismiss()
                }
            }
        }
    }
}

struct SheetWithPresentationDetents: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    @State private var selectedCell: CellModel?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(data.cells) { cell in
                    Cell(cell: cell)
                        .onTapGesture {
                            selectedCell = cell
                        }
                }
            }
            .sheet(item: $selectedCell) { cell in
                NavigationStack {
                    Form {
                        LabeledContent("Title:", value: "\(cell.title)")
                        LabeledContent("Description:", value: "\(cell.description)")
                        LabeledContent("Color:") {
                            cell.color
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                .frame(width: 100)
                        }
                    }
                }
//                .presentationDetents([.medium])
                .presentationDetents([.height(250), .medium])
            }
        }
    }
}

struct FullScreenCover: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    @State private var showSheet = false
    @State private var newCell = CellModel(title: "", description: "", color: .blue)
    @State private var selectedCell: CellModel?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(data.cells) { cell in
                    Cell(cell: cell)
                        .onTapGesture {
                            selectedCell = cell
                        }
                }
            }
            .toolbar {
                Button {
                    showSheet = true
                } label: {
                    Label("Add Cell", systemImage: "plus")
                }

            }
            .fullScreenCover(isPresented: $showSheet) {
                newCell = CellModel(title: "", description: "", color: .blue)
            } content: {
                NavigationStack {
                    CellForm(cell: $newCell, isNew: true)
                        .environment(data)
                }
                .interactiveDismissDisabled()
            }
            .fullScreenCover(item: $selectedCell) { cell in
                NavigationStack {
                    Form {
                        LabeledContent("Title:", value: "\(cell.title)")
                        LabeledContent("Description:", value: "\(cell.description)")
                        LabeledContent("Color:") {
                            cell.color
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                .frame(width: 100)
                        }
                    }
                    .toolbar {
                        Button("Close") {
                            selectedCell = nil
                        }
                    }
                }
            }
        }
    }
}

// MARK: - Inspector
// Inspector and sheet are nearly identical on iPhone but on iPad Inspector is displayed from the trailing side.

struct Inspector: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    @State private var showInspector: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(data.cells) { cell in
                    Cell(cell: cell)
                        .onTapGesture {
                            showInspector = true
                        }
                }
            }
            .inspector(isPresented: $showInspector) {
                Text("Inspector")
            }
        }
    }
}

#Preview {
    Sheet()
}

#Preview("Presentation Detents") {
    SheetWithPresentationDetents()
}

#Preview("Full Screen Cover") {
    FullScreenCover()
}

#Preview("Inspector") {
    Inspector()
}
