//
//  ContentView.swift
//  calculator
//
//  Created by Danny on 16/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var displayText = "0"
    @State private var currentInput = ""
    @State private var storedValue: Double? = 0
    @State private var currentOperator: String?
    var body: some View {
        VStack {
            
            Text(displayText).font(.system(size: 80)).multilineTextAlignment(.trailing).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            CalculatorButtonRow(buttons: ["AC","+/-","%","÷"])
            CalculatorButtonRow(buttons: ["7","8","9","x"])
            CalculatorButtonRow(buttons: ["4","5","6","-"])
            CalculatorButtonRow(buttons: ["1","2","3","+"])
            CalculatorButtonRow(buttons: ["0",".","="])
        }
        .padding()
    }
}

struct CalcButton: View {
    let buttonLabel: String
    
    let color: Color = .gray
    private func buttonColor() -> Color {
        if  ["=", "+", "-", "x","÷"].contains(buttonLabel) {
            return .orange
        }
        else if ["+/-", "%", "AC"].contains(buttonLabel){
            return .blue
        }
        return .gray
    }
    private func buttonSize(type: String) -> Double{
        if buttonLabel == "0" && type == "width"
            {
                return ((UIScreen.main.bounds.width-5*12)/2)
            }
            return ((UIScreen.main.bounds.width-5*12)/4)
    }
    var body: some View {
        Button{
        } label:{
            Text( buttonLabel).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).frame(width: buttonSize(type: "width"), height: buttonSize(type: "height"))
                .background(buttonColor())
                .foregroundColor(.white)
                .cornerRadius(buttonSize( type: "width"))
        }

    }
}
struct CalculatorButtonRow: View {
    let buttons:[String]
//    let action: (String) -> Void
    
    var body: some View {
        
        HStack(spacing: 12) {
            ForEach(buttons, id:\.self){buttonLabel in
                CalcButton(buttonLabel:buttonLabel)
                
            }
        }
    }
}

#Preview {
    ContentView()
}
