//
//  KeyPadNumber.swift
//  SecurePassword
//
//  Created by 박성준 on 2023/03/22.
//

import SwiftUI

struct KeyPadNumber: View {
    var number: String
    
    var body: some View {
        Button(action: {
            NumberData().inputPassword?.append(number)
        }, label: {
            Text(number)
                .frame(width: 100, height: 100)
                .background(.gray)
                .foregroundColor(.white)
                .bold()
                .font(.system(size: 50))
                .cornerRadius(50)
        })
    }
}

struct KeyPadNumber_Previews: PreviewProvider {
    static var previews: some View {
        KeyPadNumber(number: NumberData().numbers[0][0])
    }
}
