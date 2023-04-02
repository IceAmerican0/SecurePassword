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
    @Published var inputPassword: [String] = ["","","",""]
}

// MARK: - 랜덤 키패드 숫자 생성
func loadRandomNumber() -> [[String]] {
    // [4][3] 키패드크기 초기화
    var randomArray = Array(repeating: Array(repeating: "1", count: 3), count: 4)
    var order = 0
    
    let numbers = Array(0...9).shuffled().prefix(10).map { String($0) }
    
    for row in 0..<randomArray.count {
        for column in 0..<randomArray[row].count {
            switch order {
                case 9 :
                    randomArray[row][column] = ""
                    break
                case 10 :
                    randomArray[row][column] = numbers.last!
                    break
                case 11 :
                    randomArray[row][column] = "<"
                    break
                default :
                    randomArray[row][column] = numbers[order]
                    break
            }
            order += 1
        }
    }
    
    return randomArray
}
