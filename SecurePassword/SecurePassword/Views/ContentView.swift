//
//  ContentView.swift
//  SecurePassword
//
//  Created by 박성준 on 2023/03/22.
//

import SwiftUI

struct ContentView: View {
    @State private var correctPassword = false
    
    var body: some View {
        if correctPassword {
            HomeView()
        } else {
            PasswordView(correctPassword: $correctPassword)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(NumberData())
    }
}
