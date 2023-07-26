//
//  ConversionViewWithAnimation.swift
//  DunyaGezgini
//
//  Created by Çare C. on 6.07.2023.
//

import SwiftUI

struct ConversionViewWithAnimation: View {
    
    @State var fahreneitValue: String = ""
    
    @State var isVisible = false
    
    let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter
    }()
    
    func convertToCelcius() -> String {
        
        if let value = Double (fahreneitValue) {
            let fahrenheit =  Measurement<UnitTemperature>(value: value, unit:.fahrenheit )
            let celsiusValue = fahrenheit.converted(to: .celsius)
            
            return  numberFormatter.string(from: NSNumber(value: celsiusValue.value)) ?? "???"
        } else {
            return "???"
        }
    }
    
    var body: some View {
        VStack {
            TextField("CONVERSION_TEXT_FIELD_PLACEHOLDER", text: $fahreneitValue)
                .keyboardType(.decimalPad)
                .font(Font.system(size: 64.0))
                .multilineTextAlignment(.center)
            
            Text("CONVERSION_FAHRENHEIT")
            
            Text("CONVERSION_IS_ACTUALLY")
                .foregroundColor(.gray)
            
            Text(convertToCelcius())
                .font(Font.system(size: 64.0))
            
            Text("CONVERSION_DEGREES_CELCIUS")
            
            Spacer()
            
        }
        .padding()
        .font(.title)
        .opacity(isVisible ? 1.0 : 0.0 )
        .offset(x: 0, y:isVisible ? 0 : 20 )
        .foregroundColor(.orange)
//        .animation(.easeIn(duration: 2.0)) -- iOs 16 güncellemesi
        .onAppear {    
            withAnimation(.easeIn(duration: 1.0)){
                self.isVisible = true
            }
        }
            
    }
}

struct ConversionViewWithAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ConversionViewWithAnimation()
    }
}
