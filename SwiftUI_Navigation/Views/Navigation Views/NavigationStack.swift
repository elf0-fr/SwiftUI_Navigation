//
//  NavigationStack.swift
//  SwiftUI_Navigation
//
//  Created by Elfo on 14/01/2025.
//

import SwiftUI

struct NavigationWithNavigationStack: View {
    var body: some View {
        NavigationStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .navigationTitle("My Title")
        }
    }
}

#Preview {
    NavigationWithNavigationStack()
}
