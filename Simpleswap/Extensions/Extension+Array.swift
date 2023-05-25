//
//  Extension+Array.swift
//  Simpleswap
//
//  Created by apple on 23.05.2023.
//

import Foundation
extension Array {
    func take(firstElement: Int, elementsCount: Int) -> [Element] {
        let min = Swift.min(elementsCount, count)
        return Array(self[firstElement..<min])
    }
}
