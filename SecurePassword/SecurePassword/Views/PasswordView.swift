//
//  PasswordView.swift
//  SecurePassword
//
//  Created by 박성준 on 2023/03/22.
//

import SwiftUI

struct PasswordView: View {
    @EnvironmentObject var numberData: NumberData
    
    var body: some View {
        VStack {
            HStack {
                ForEach(numberData.inputPassword, id: \.self) { count in
                    Image(systemName: count == "" ? "star" : "star.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
            }
            
            Spacer()
                .frame(height: 100)
            
            ForEach(numberData.numbers, id: \.self) { line in
                HStack {
                    ForEach(line, id: \.self) { row in
                        if (row == "") {
                            Spacer()
                                .frame(width: 106, height: 106)
                        } else {
                            KeyPadNumber(number: row)
                        }
                    }
                }
            }
        }
    }
}

struct PasswordView_Previews: PreviewProvider {
    static let numberData = NumberData()
    
    static var previews: some View {
        PasswordView()
            .environmentObject(NumberData())
    }
}
