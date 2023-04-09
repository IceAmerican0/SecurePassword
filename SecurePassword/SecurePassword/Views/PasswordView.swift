//
//  PasswordView.swift
//  SecurePassword
//
//  Created by 박성준 on 2023/03/22.
//

import SwiftUI

struct PasswordView: View {
    @EnvironmentObject var numberData: NumberData
    @Binding var correctPassword: Bool
    @State private var showAlert = false
    @State private var errorCount = 0
    
    var body: some View {
        VStack {
            if errorCount == 0 {
                Text("비밀번호를 입력해주세요")
            } else {
                Text("비밀번호를 \(errorCount)회 잘못 입력했습니다")
            }
            
            Spacer()
                .frame(height: 20)
            
            HStack {
                ForEach(numberData.inputPassword, id: \.self) { count in
                    Image(systemName: count == "" ? "star" : "star.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
            }
            
            Spacer()
                .frame(height: 70)
            
            ForEach(numberData.numbers, id: \.self) { line in
                HStack {
                    ForEach(line, id: \.self) { row in
                        if (row == "") {
                            Spacer()
                                .frame(width: 106, height: 106)
                        } else {
                            keyPadNumber(number: row)
                        }
                    }
                }
            }
        }
    }
    
    func keyPadNumber(number: String) -> some View {
        Button(action: {
            if (number == "<") {
                if let lastIndex = numberData.inputPassword.lastIndex(where: { $0 != ""}) {
                    numberData.inputPassword[lastIndex] = ""
                } else { return }
            } else {
                if let firstIndex = numberData.inputPassword.firstIndex(of: "") {
                    numberData.inputPassword[firstIndex] = number
                    if firstIndex == 3 {
                        let password = "1234"
                        if password == numberData.inputPassword.joined() {
                            correctPassword.toggle()
                        } else {
                            errorCount += 1
                            numberData.inputPassword = ["","","",""]
                        }
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

struct PasswordView_Previews: PreviewProvider {
    static let numberData = NumberData()
    
    static var previews: some View {
        PasswordView(correctPassword: .constant(false))
            .environmentObject(NumberData())
    }
}
