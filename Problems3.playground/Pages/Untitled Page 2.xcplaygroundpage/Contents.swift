//: [Previous](@previous)

import Foundation

/*
 Find the non repeating element in an sorted array
 */

func uniqueElement(_ array: [Int]) -> Int {
    var ans = 0
    guard !array.isEmpty else { return ans }
    
    for item in array {
        ans ^= item
    }
    
    return ans
}

let arr = [1,1,2,2,8,8,3,3,3,3,9,4,4,5,5,6,6,7,7]
uniqueElement(arr)


enum Direction {
    case left
    case right
    case up
    case down
}

func spiral(matrix: [[Int]]) {
    var left = 0
    var right = matrix[0].count - 1
    var up = 0
    var down = matrix.count - 1
    var dir: Direction = .right
    
    while left <= right && up <= down {
        if dir == .right {
            for i in left...right {
                print(matrix[up][i])
            }
            up += 1
            dir = .down
            
        } else if dir == .down {
            var i = up
            while i <= down {
                print(matrix[i][right])
                i += 1
            }
            dir = .left
            right -= 1
            
        } else if dir == .left {
            var i = right
            while i >= left {
                print(matrix[down][i])
                i -= 1
            }
            down -= 1
            dir = .up
            
        } else {
            var i = down
            while i >= up {
                print(matrix[i][left])
                i -= 1
            }
            left += 1
            dir = .right
            
        }
    }
}

let arr = [
            [1,2,3,4],
            [5,6,7,8],
            [9,10,11,12],
            [13,14,15,16]
         ]

spiral(matrix: arr)


