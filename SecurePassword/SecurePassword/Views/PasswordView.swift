//
//  PasswordView.swift
//  SecurePassword
//
//  Created by 박성준 on 2023/03/22.
//

import SwiftUI

struct PasswordView: View {
    private let numberData = NumberData().numbers
    private let inputPassword = NumberData().inputPassword
    
    var body: some View {
        VStack {
            HStack {
                ForEach(inputPassword, id: \.self) { count in
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
            }
            
            Spacer()
                .frame(height: 100)
            
            ForEach(numberData, id: \.self) { line in
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
    static var previews: some View {
        PasswordView()
    }
}
