//
//  CellDetail.swift
//  SwiftUI_Navigation
//
//  Created by Elfo on 14/01/2025.
//

import SwiftUI

struct CellDetail: View {
    
    let cell: CellModel
    
    var body: some View {
        cell.color
            .overlay(alignment: .topLeading) {
                Text(cell.description)
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundStyle(.thickMaterial)
                    }
                    .padding()
            }
    }
}

#Preview {
    CellDetail(cell: CellModel.sampleData[0])
}
