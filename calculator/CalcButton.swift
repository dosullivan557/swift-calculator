//
//  CalcButton.swift
//  calculator
//
//  Created by Danny on 22/12/2023.
//

import Foundation
import SwiftUI

struct CalcButton: View {
    let buttonLabel: String
    let action:  (String) -> Void
    let color: Color = .gray
    private func buttonColor() -> Color {
        if ["=", "+", "-", "x","÷"].contains(buttonLabel) {
            return .orange
        } else if ["+/-", "%", "AC"].contains(buttonLabel) {
            return .blue
        }
        return .gray
    }
    
    
    private func buttonSize(type: String) -> CGFloat {
        if type == "width" {
            if  ["0", "AC"].contains(buttonLabel) && type == "width" {
                return ((UIScreen.main.bounds.width - 5 * 12) / 2)+13.5
            }
            return ((UIScreen.main.bounds.width - 5 * 12) / 4)
        }
        if  ["0", "AC"].contains(buttonLabel) && type == "width" {
            return ((UIScreen.main.bounds.width - 10 * 12) / 2)+13.5
        }
        return ((UIScreen.main.bounds.width - 10 * 12) / 4)
        
    }
    
    
    
    var body: some View {
        Button(action: {
            action(buttonLabel)
        }) {
            Text(buttonLabel)
                .font(.title)
                .frame(width: buttonSize(type: "width"), height: buttonSize(type: "height"))
                .background(buttonColor())
                .foregroundColor(.white)
                .cornerRadius(buttonSize(type: "width")).padding(3)
                .bold()
        }
    }
}
