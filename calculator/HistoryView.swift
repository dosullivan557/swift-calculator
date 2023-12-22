//
//  HistoryView.swift
//  calculator
//
//  Created by Danny on 22/12/2023.
//

import Foundation
import SwiftUI



struct HistoryView: View {
    @Binding var equations: [String]
    
    // Content for the second tab
    var body: some View {
        NavigationStack {
            List($equations , id:\.self,
                 editActions: .delete
            ){equation in
                ForEach(equations, id: \.self) { equation in
                    Text(equation)
                        .textSelection(.enabled)
                    
                }
                .font(.system(size: 25))
                .multilineTextAlignment(.trailing).frame(maxWidth: .infinity)
                .padding()
                .textSelection(.enabled)
            }.navigationTitle("History")
                .navigationBarTitleDisplayMode(.inline)
            
            
        }
    }
}

