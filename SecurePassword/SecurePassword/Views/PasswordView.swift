//
//  PasswordView.swift
//  SecurePassword
//
//  Created by 박성준 on 2023/03/22.
//

import SwiftUI

struct PasswordView: View {
    @State private var column = 0
    private let numberData = NumberData().numbers
    
    
    var body: some View {
        VStack {
            HStack {
                ForEach(numberData, id: \.self) { line in
                    ForEach(numberData, id: \.self) { row in
//                        KeyPadNumber(row)
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
