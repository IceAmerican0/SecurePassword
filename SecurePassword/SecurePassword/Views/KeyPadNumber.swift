//
//  KeyPadNumber.swift
//  SecurePassword
//
//  Created by 박성준 on 2023/03/22.
//

import SwiftUI

struct KeyPadNumber: View {
    var number: Number
    
    var body: some View {
        Button(action: {
            
        }, label: {
            Text(number.number)
                .foregroundColor(.black)
                .bold()
                .font(.largeTitle)
                .frame(width: 50, height: 50, alignment: .center)
        })
    }
}

struct KeyPadNumber_Previews: PreviewProvider {
    static var previews: some View {
        KeyPadNumber(number: NumberData().numbers[0])
    }
}
