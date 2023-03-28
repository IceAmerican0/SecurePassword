//
//  NumberData.swift
//  SecurePassword
//
//  Created by 박성준 on 2023/03/22.
//

import Foundation
import Combine

final class NumberData: ObservableObject {
    @Published var numbers: [[String]] = loadRandomNumber()
    @Published var inputPassword: [String]?
}

func loadRandomNumber() -> [[String]] {
    return [["7","8","9"],["4","5","6"],["1","2","3"],["","0","<-"]]
}
