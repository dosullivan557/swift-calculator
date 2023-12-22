//
//  calulator_page.swift
//  calculator
//
//  Created by Danny on 21/12/2023.
//

import Foundation
import SwiftUI

struct ContentView: View {
    
    @State private var displayText = "0"
    @State private var currentInput = ""
    @State private var storedValue: Double? = 0
    @State private var currentOperator: String?
    @State private var wholeEquation: String = ""
    @State private var equations: [String] = []
    
    func action(valuePressed: String) -> Void {
        //        CLEAR
        if valuePressed == "AC" {
            displayText = "0"
            storedValue = 0
            currentOperator = nil
            wholeEquation = ""
            return
        }
        if valuePressed == "%" {
            storedValue = Double(displayText)! / 100
            displayText = String(Double(displayText)! / 100)
            return
        }
        if ["+","-","x","÷"].contains(valuePressed) {
            if wholeEquation.rangeOfCharacter(from: CharacterSet.decimalDigits) == nil {
                return
            }
            currentOperator = valuePressed
            storedValue = storedValue! + Double(displayText)!
            
            displayText = "0"
        }
        wholeEquation = wholeEquation + valuePressed
        
        formatter.minimumFractionDigits = 0
        formatter.numberStyle = .decimal
        
        
        //        HANDLE NUMBER
        if ["1","2","3","4","5","6","7","8","9","0","." ].contains(valuePressed) {
            //            Handle if no value already
            if displayText == "0"{
                displayText = valuePressed
            }
            else if displayText == "-0"{
                displayText = "-" + valuePressed
            }
            else if valuePressed == "." {
                if displayText == "0" {
                    displayText = "0."
                    
                }
                else {
                    displayText = displayText + "."
                }
            }
            else{
                //                Handle add to end of number
                displayText = displayText + valuePressed
            }
        }
        else if valuePressed == "+/-" {
            
            if displayText.starts(with: "-") {
                displayText = String(displayText.dropFirst())
            }
            else {
                displayText = "-" + displayText
            }
        }
        else if valuePressed == "=" {
            if currentOperator == "+" {
                
                let result = (formatter.string(from: ( storedValue! + Double(displayText)!) as NSNumber) ?? "n/a")
                wholeEquation = wholeEquation + result
                
                displayText = result
            }
            else if currentOperator == "-" {
                let result = (formatter.string(from: ( storedValue! - Double(displayText)!) as NSNumber) ?? "n/a")
                wholeEquation = wholeEquation + result
                
                displayText = result
            }      else if currentOperator == "x" {
                let result = (formatter.string(from: ( storedValue! * Double(displayText)!) as NSNumber) ?? "n/a")
                wholeEquation = wholeEquation + result
                
                displayText = result
                
            }      else if currentOperator == "÷" {
                let result = (formatter.string(from: ( storedValue! / Double(displayText)!) as NSNumber) ?? "n/a")
                wholeEquation = wholeEquation + result
                displayText = result
            }
            storedValue=0
            equations.insert(wholeEquation, at: 0)
            
            wholeEquation = displayText
            
        }
    }
    
    func copyToClipboard() {
        UIPasteboard.general.string = displayText
    }
    var body: some View {
        VStack(alignment: .trailing) {
            
            Text(displayText).font(.system(size: 80)).multilineTextAlignment(.trailing).frame(maxWidth: .infinity)
                .padding()
                .textSelection(.enabled)
            Spacer()
            
            //            ScrollView {
            
            Text(wholeEquation).font(.system(size: 25)).multilineTextAlignment(.trailing).frame(maxWidth: .infinity)
                .padding()
                .textSelection(.enabled)
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
                }
                
                
                
            }
            Spacer()
            
            VStack(alignment: .leading, spacing: 5) {
                CalculatorButtonRow(buttons: ["AC","+/-","÷"], action: action)
                CalculatorButtonRow(buttons: ["7","8","9","x"], action: action)
                CalculatorButtonRow(buttons: ["4","5","6","-"], action: action)
                CalculatorButtonRow(buttons: ["1","2","3","+"], action: action)
                CalculatorButtonRow(buttons: ["0",".","="], action: action)
                
            }
            .frame(maxHeight: .infinity)
            .padding()
            
            
        }
    }
    
}
