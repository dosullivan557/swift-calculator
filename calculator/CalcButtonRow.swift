//
//  CalcButtonRow.swift
//  calculator
//
//  Created by Danny on 22/12/2023.
//

import Foundation
import SwiftUI

struct CalculatorButtonRow: View {
    let buttons:[String]
    let action:  (String) -> Void
    
    var body: some View {
        
        HStack() {
            ForEach(buttons, id:\.self){buttonLabel in
                CalcButton(buttonLabel:buttonLabel, action: action)
                
            }
        }
    }
}

