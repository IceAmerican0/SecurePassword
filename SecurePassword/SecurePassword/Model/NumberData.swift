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

func loadRandomNumber() -> [[String]] {
    // [3][4] 키패드크기 초기화
    var randomArray = Array(repeating: Array(repeating: "1", count: 3), count: 4)
    var numbers: [String] = []
    var order = 0
    
    while numbers.count < 10 {
        let numberString = String(Int.random(in: 0...9))
        
        if numbers.contains(numberString) == false {
            numbers.append(numberString)
        }
    }
    
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
