//
//  SecurePasswordApp.swift
//  SecurePassword
//
//  Created by 박성준 on 2023/03/22.
//

import SwiftUI

@main
struct SecurePasswordApp: App {
    @StateObject private var numberData = NumberData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(numberData)
        }
    }
}
