//
//  TabView.swift
//  SwiftUI_Navigation
//
//  Created by Elfo on 14/01/2025.
//

import SwiftUI

struct NavigationWithTabView: View {
    var body: some View {
        TabView {
            Tab {
                Text("Hello, World!")
            } label: {
                Label("Home", systemImage: "house")
            }
            
            Tab("Received", systemImage: "tray.and.arrow.down.fill") {
                Text("Received")
            }
            .badge("!")
            
            Tab(role: .search) {
                Text("Search")
            }
        }
    }
}

struct NavigationWithTabViewAndSelection: View {
    @State private var selection: Int = 0
    
    var body: some View {
        TabView(selection: $selection) {
            Tab(value: 0) {
                Button("Go to page 2") {
                    selection = 1
                }
            } label: {
                Label("Home", systemImage: "house")
            }
            
            Tab("Received", systemImage: "tray.and.arrow.down.fill", value: 1) {
                Button("Go to search page") {
                    selection = 2
                }
            }
            
            Tab(value: 2, role: .search) {
                Button("Go to Home") {
                    selection = 0
                }
            }
        }
    }
}

struct NavigationWithTabViewAndTabStylePage: View {
    var body: some View {
        TabView {
            Tab {
                Text("Hello, World!")
            } label: {
                Label("Home", systemImage: "house")
            }
            
            Tab("Received", systemImage: "tray.and.arrow.down.fill") {
                Text("Received")
            }
            
            Tab(role: .search) {
                Text("Search")
            }
        }
        .background(.green)
        .tabViewStyle(.page)
//        .tabViewStyle(.page(indexDisplayMode: .never))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

struct NavigationWithTabViewAndTabStyleSidebar: View {
    var body: some View {
        TabView {
            Tab("Requests", systemImage: "paperplane") {
                Text("Requests page")
            }
            
            Tab("Account", systemImage: "person.crop.circle.fill") {
                Text("Account page")
            }
            
            TabSection("Messages") {
                Tab("Received", systemImage: "tray.and.arrow.down.fill") {
                    Text("Received")
                }
                
                Tab("Sent", systemImage: "tray.and.arrow.up.fill") {
                    Text("Sent")
                }
                
                Tab("Drafts", systemImage: "pencil") {
                    Text("Drafts")
                }
            }
        }
        .tabViewStyle(.sidebarAdaptable)
    }
}

struct NavigationWithTabViewAndCustomization: View {
    
    @AppStorage("customization") private var customization: TabViewCustomization
    
    var body: some View {
        TabView {
            Tab("Requests", systemImage: "paperplane") {
                Text("Requests page")
            }
            .customizationID("com.example.requests")
            
            Tab("Account", systemImage: "person.crop.circle.fill") {
                Text("Account page")
            }
            .customizationID("com.example.account")
            
            TabSection("Messages") {
                Tab("Received", systemImage: "tray.and.arrow.down.fill") {
                    Text("Received")
                }
                .customizationID("com.example.messages.received")
                
                Tab("Sent", systemImage: "tray.and.arrow.up.fill") {
                    Text("Sent")
                }
                .customizationID("com.example.messages.sent")
                
                Tab("Drafts", systemImage: "pencil") {
                    Text("Drafts")
                }
                .customizationID("com.example.messages.drafts")
            }
            .customizationID("com.example.messages")
        }
        .tabViewStyle(.sidebarAdaptable)
        .tabViewCustomization($customization)
    }
}

#Preview {
    NavigationWithTabView()
}

#Preview("Selection") {
    NavigationWithTabViewAndSelection()
}

#Preview("Page Style") {
    NavigationWithTabViewAndTabStylePage()
}

#Preview("Sidebar Style") {
    NavigationWithTabViewAndTabStyleSidebar()
}

#Preview("Customization") {
    NavigationWithTabViewAndCustomization()
}
