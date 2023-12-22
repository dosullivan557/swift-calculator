//
//  ContentView.swift
//  calculator
//
//  Created by Danny on 16/12/2023.
//

import SwiftUI
import UIKit
import Foundation

let numberFormatter = NumberFormatter()
let formatter = NumberFormatter()

struct ContentView: View {
    @State private var equations: [String] = []
    
    var body: some View {
        TabView {
            CalculatorView(equations: $equations)
                .tabItem {
                    Label("Calculator", systemImage: "square.and.pencil.circle")
                }
            
            HistoryView(equations: $equations)
                .tabItem {
                    Label("History", systemImage: "clock.fill")
                }
        }
    }
}


#Preview {
    ContentView()
}
