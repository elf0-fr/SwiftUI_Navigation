//
//  Toolbar.swift
//  SwiftUI_Navigation
//
//  Created by Elfo on 12/01/2025.
//

import SwiftUI

struct Toolbar: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(data.cells) { cell in
                    Cell(cell: cell)
                }
            }
            .navigationTitle("My List")
            .toolbar {
                Button {
                    print("Item Added")
                } label: {
                    Label("Add", systemImage: "plus")
                }
            }
        }
    }
}

struct ToolbarWithToolbarItem: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(data.cells) { cell in
                    Cell(cell: cell)
                }
            }
            .navigationTitle("My List")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        print("Primary")
                    } label: {
                        Text("Primary")
                    }
                }
                
                ToolbarItem(placement: .secondaryAction) {
                    Button {
                        print("Secondary")
                    } label: {
                        Text("Secondary")
                    }
                }
                
                ToolbarItem(placement: .navigation) {
                    Button {
                        print("Navigation")
                    } label: {
                        Text("Navigation")
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    Button {
                        print("Principal")
                    } label: {
                        Text("Principal")
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        print("Cancel")
                    } label: {
                        Text("Cancel")
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        print("Confirm")
                    } label: {
                        Text("Confirm")
                    }
                }
                
                ToolbarItem(placement: .destructiveAction) {
                    Button {
                        print("Destructive")
                    } label: {
                        Text("Destructive")
                    }
                }
                
                ToolbarItem(placement: .status) {
                    Button {
                        print("Status")
                    } label: {
                        Text("Status")
                    }
                }
                
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        print("Status")
                    } label: {
                        Text("Status")
                    }
                }
            }
        }
    }
}

struct ToolbarWithToolbarItemGroup: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(data.cells) { cell in
                    Cell(cell: cell)
                }
            }
            .navigationTitle("My List")
            .toolbar {
                ToolbarItemGroup(placement: .primaryAction) {
                    Button {
                        print("star")
                    } label: {
                        Label("star", systemImage: "star")
                    }
                    
                    Button {
                        print("person")
                    } label: {
                        Label("person", systemImage: "person")
                    }
                }
                
                ToolbarItemGroup(placement: .secondaryAction) {
                    Button {
                        print("Item Added")
                    } label: {
                        Label("Add", systemImage: "plus")
                    }
                    
                    Button {
                        print("Item Added")
                    } label: {
                        Label("Remove", systemImage: "trash")
                    }
                }
            }
        }
    }
}

struct ToolbarWithToolbarContent: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(data.cells) { cell in
                    Cell(cell: cell)
                }
            }
            .navigationTitle("My List")
            .toolbar {
                MainToolbar()
            }
        }
    }
}

struct MainToolbar: ToolbarContent {
    var body: some ToolbarContent {
        ToolbarItemGroup(placement: .primaryAction) {
            Button("Save") {
                print("Save")
            }
            
            Button("Update") {
                print("Update")
            }
        }
    }
}

struct ToolbarWithToolbarTitleMenu: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(data.cells) { cell in
                    Cell(cell: cell)
                }
            }
            .navigationTitle("My List")
            .navigationBarTitleDisplayMode(.inline)
//            .toolbarRole(.browser)
            .toolbarTitleMenu {
                Button {
                    print("Item Added")
                } label: {
                    Label("Add", systemImage: "plus")
                }
                
                Button(role: .destructive) {
                    print("Item Added")
                } label: {
                    Label("Remove", systemImage: "trash")
                }
            }
        }
    }
}

struct ToolbarWithId: View {
    
    @State private var data = ApplicationData(cells: CellModel.sampleData)
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(data.cells) { cell in
                    Cell(cell: cell)
                }
            }
            .navigationTitle("My List")
            .toolbar(id: "My Toolbar") {
                ToolbarItem(id: "Favorite", placement: .primaryAction) {
                    Button {
                        print("Favorite")
                    } label: {
                        Label("Favorite", systemImage: "star")
                    }
                }
                
                ToolbarItem(id: "Add", placement: .secondaryAction) {
                    Button {
                        print("Item Added")
                    } label: {
                        Label("Add", systemImage: "plus")
                    }
                }
                
                ToolbarItem(id: "font", placement: .secondaryAction) {
                    ControlGroup {
                        Button {
                            // decrease font
                        } label: {
                            Label("Decrease font size", systemImage: "textformat.size.smaller")
                        }
                        
                        Button {
                            // increase font
                        } label: {
                            Label("Increase font size", systemImage: "textformat.size.larger")
                        }
                    } label: {
                        Label("Font Size", systemImage: "textformat.size")
                    }
                }
                
                // This does not work ...
                ToolbarItem(id: "test", placement: .secondaryAction) {
                    Button {
                        print("Item Selected")
                    } label: {
                        Label("test", systemImage: "lasso")
                    }
                }
                .defaultCustomization(.hidden)
            }
            .toolbarRole(.editor)
        }
    }
}

#Preview("TB Item") {
    ToolbarWithToolbarItem()
}

#Preview("TB Item Group") {
    ToolbarWithToolbarItemGroup()
}

#Preview("TB Content") {
    ToolbarWithToolbarContent()
}

#Preview("TB Title Menu") {
    ToolbarWithToolbarTitleMenu()
}

#Preview("With id") {
    ToolbarWithId()
}
