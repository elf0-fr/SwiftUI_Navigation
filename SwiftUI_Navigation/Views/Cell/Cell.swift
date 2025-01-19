//
//  Cell.swift
//  SwiftUI_Navigation
//
//  Created by Elfo on 12/01/2025.
//

import SwiftUI

struct Cell: View {
    
    let cell: CellModel
    
    var body: some View {
        HStack {
            cell.color
                .frame(width: 80, height: 100)
            VStack(alignment: .leading) {
                Text(cell.title).bold()
                Text(cell.description).font(.caption)
                Spacer()
            }.padding([.leading])
            Spacer()
        }
        .padding([.top, .bottom], 5)
        .padding([.leading, .trailing], 10)
    }
}
