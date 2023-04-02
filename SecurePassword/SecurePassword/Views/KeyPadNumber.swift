//
//  KeyPadNumber.swift
//  SecurePassword
//
//  Created by 박성준 on 2023/03/22.
//

import SwiftUI

struct KeyPadNumber: View {
    @EnvironmentObject var numberData: NumberData
    var number: String
    
    var body: some View {
        Button(action: {
            if (number == "<") {
                if let lastIndex = numberData.inputPassword.lastIndex(where: { $0 != ""}) {
                    numberData.inputPassword[lastIndex] = ""
                }
            } else {
                if let firstIndex = numberData.inputPassword.firstIndex(of: "") {
                    numberData.inputPassword[firstIndex] = number
                    if firstIndex == 3 {
                        print("input finish")
                    }
                }
            }
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
    static let numberData = NumberData()
    
    static var previews: some View {
        KeyPadNumber(number: NumberData().numbers[0][0])
            .environmentObject(numberData)
    }
}
