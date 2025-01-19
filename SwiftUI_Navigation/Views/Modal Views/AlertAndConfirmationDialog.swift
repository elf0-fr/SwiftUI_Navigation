//
//  Alert.swift
//  SwiftUI_Navigation
//
//  Created by Elfo on 16/01/2025.
//

import SwiftUI

struct Alert: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    @State private var showAlert: Bool = false
    @State private var showAlert2: Bool = false
    @State private var selectedCell: CellModel?
    
    var body: some View {
        NavigationStack {
            Button("Popover") {
                showAlert = true
            }
            .alert("Error", isPresented: $showAlert) {
                Button("Cancel", role: .cancel) {
                    
                }
                
                Button("Ok") {
                    
                }
            } message: {
                Text("Message")
            }

            List {
                ForEach(data.cells) { cell in
                    Cell(cell: cell)
                        .onTapGesture {
                            selectedCell = cell
                            showAlert2 = true
                        }
                }
            }
            .alert(selectedCellTitle, isPresented: $showAlert2, presenting: selectedCell) { cell in
                Button("Deselect", role: .cancel) {
                    
                }
            }
        }
    }
    
    var selectedCellTitle: String {
        guard let selectedCell else {
            return "No cell selected"
        }
        return "Cell selected: \(selectedCell.title)"
    }
}

struct ConfirmationDialog: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    @State private var showConfirmationDialog: Bool = false
    @State private var showConfirmationDialog2: Bool = false
    
    var body: some View {
        NavigationStack {
            Button("Popover") {
                showConfirmationDialog = true
            }
            .confirmationDialog("A confirmation dialog", isPresented: $showConfirmationDialog, titleVisibility: .visible) {
                Button("An action") {
                    
                }
                
                Button("Delete", role: .destructive) {
                    
                }
                
                Button("Cancel", role: .cancel) {
                    
                }
            } message: {
                Text("A message")
            }


            List {
                ForEach(data.cells) { cell in
                    Cell(cell: cell)
                        .onTapGesture {
                            showConfirmationDialog2 = true
                        }
                        .confirmationDialog("Delete", isPresented: $showConfirmationDialog2) {
                            Button("An action") {
                                
                            }
                            
                            Button("Cancel", role: .cancel) {
                                
                            }
                            
                            Button("Delete", role: .destructive) {
                                
                            }
                        }
                }
            }
        }
    }
}

#Preview {
    Alert()
}

#Preview("Confirmation Dialog") {
    ConfirmationDialog()
}
