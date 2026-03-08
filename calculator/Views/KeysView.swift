//
//  KeysView.swift
//  calculator
//
//  Created by theo tsouroupakis on 2025-10-04.
//

import SwiftUI

struct KeysView: View {
    
    @State var value = "0"
    @State var runningNumber = 0
    @State var currentOperation: Operation = .none
    @State private var ChangeColor = false
    
    let buttons: [[Keys]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .substract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    
    
    var body: some View {
        VStack{
            Spacer()
            
            HStack{
                RoundedRectangle(cornerRadius: 15)
                    .foregroundStyle(ChangeColor ? Color.orange : Color.pink.opacity(0.2))
                    .frame(width: 350, height: 280)
                    .scaleEffect(ChangeColor ? 1.5 : 1.0)
                    .animation(Animation.easeInOut.speed(0.17),
                               value: ChangeColor)
                    .onAppear{
                        self.ChangeColor.toggle()
                    }.overlay {
                        Text(value)
                            .font(.system(size: 100))
                            .foregroundStyle(.black)
                    }
            }
        }.padding()
        
        
        ForEach(buttons, id: \.self) { row in
           HStack(spacing: 12) {
               ForEach(row, id: \.self) { element in
                   Button {
                       print(element.rawValue)
                       didTap(button: element)
                   } label: {
                       Text(element.rawValue)
                           .font(.system(size: 30))
                           .frame(width: self.getWith(element: element), height: self.getHeight(element: element))
                           .background(element.buttonColor)
                           .foregroundStyle(.black)
                           .clipShape(RoundedRectangle(cornerRadius: self.getWith(element: element) / 2))
                           .shadow(color:
                                .purple.opacity(0.5), radius: 30)
                   }
               }
           }.padding(.bottom, 4)
        }
        
        
        
    }
  
    func didTap(button: Keys) {
        switch button {
        case .add, .substract, .multiply, .divide, .equal:
           if button == .add {
               self.currentOperation = .add
               self.runningNumber = Int(self.value) ?? 0
           } else if button == .substract {
               self.currentOperation = .substract
               self.runningNumber = Int(self.value) ?? 0
           } else if button == .multiply {
               self.currentOperation = .multiply
               self.runningNumber = Int(self.value) ?? 0
           } else if button == .divide {
               self.currentOperation = .divide
               self.runningNumber = Int(self.value) ?? 0
           } else if button == .equal {
               let runningValue = self.runningNumber
               let currentValue = Int(self.value) ?? 0
               // ... switch case logic to perform operation here ...
               
               switch self.currentOperation {
               case .add:
                   self.value = "\(runningValue + currentValue)"
               case .substract:
                   self.value = "\(runningValue - currentValue)"
               case .multiply:
                   self.value = "\(runningValue * currentValue)"
               case .divide:
                   self.value = "\(runningValue / currentValue)"
               case .none:
                   break
               }
           }
            
            if button != .equal {
                self.value = "0"
                
            }
            
        case.clear:
            self.value = "0"
        case .decimal, .negative, .percent:
            break
        default:
            let number = button.rawValue
            if self.value == "0"{
                self.value = number
            }else{
                self.value = "\(self.value)\(number)"
            }
        }
    }
    
    func getWith(element:Keys) -> CGFloat {
        if element == .zero {
            return((UIScreen.main.bounds.width - (5*10)) / 4)
        }
        return ((UIScreen.main.bounds.width - (5*10)) / 4)
    }
    
    func getHeight(element: Keys) -> CGFloat {
        return ((UIScreen.main.bounds.width - (5*10)) / 5)
    }
    
    
    
    
    
    
}

#Preview {
    KeysView()
}
