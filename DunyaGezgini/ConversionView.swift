//
//  ConversionView.swift
//  DunyaGezgini
//
//  Created by Çare C. on 30.06.2023.
//

import SwiftUI

struct ConversionView: View {
    
    @State var fahreneitValue: String = ""
    
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
        .foregroundColor(.orange)
    }
}

struct ConversionView_Previews: PreviewProvider {
    static var previews: some View {
        ConversionView()
    }
}
