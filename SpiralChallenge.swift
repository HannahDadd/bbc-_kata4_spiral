#!/usr/bin/env xcrun swift

import Foundation

let m = [[1,2,3,4,5], [6,7,8,9,10], [11,12,13,14,15], [16,17,18,19,20], [21,22,23,24,25]]
let addition = (m.count % 2) == 0 ? 0 : 1
var row = 0
var endCol = m[0].count - 1
var startCol = 0
let result = m.prefix((m.count / 2) + addition).map {index -> Array<Int>.SubSequence in

    // Add first one to array
    var r = m[row][startCol...endCol]
    row += 1

    if row <= m.count-row {
        // Add end of next one to array
        r += m[row..<(m.count-row)].map{ $0[endCol] }

        // Add bottom value
        r += Array(m[m.count-row][startCol...endCol].reversed())

        // Add start of matrix
        r += Array(m[row..<(m.count-row)].map{ $0[startCol] }.reversed())
        endCol -= 1
        startCol += 1
    }
    return r
}.flatMap { $0 }

print("\(result)")
