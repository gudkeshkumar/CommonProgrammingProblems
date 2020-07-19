//: [Previous](@previous)

import Foundation

func productExceptSelf(_ nums: [Int]) -> [Int] {
    var ans = Array(repeating: 1, count: nums.count)
    
    for i in 1...(nums.count - 1) {
        ans[i] = ans[i - 1] * nums[i - 1]
    }
    print(ans)
    var r = 1
    var i = nums.count - 1
    while i >= 0 {
        ans[i] = r * ans[i]
         r *= nums[i]
        i -= 1
    }    
    return ans
    
}

//let ans = productExceptSelf([1,2,3,4])

// Maximum Subarray (Kadane's Algo
func maxSubarraySum(_ nums: [Int]) -> Int {
    var ans = nums[0]
    var maxsum = nums[0]
    
    for i in 0..<nums.count {
        maxsum = max(maxsum + nums[i], nums[i])
        ans = max(ans, maxsum)
    }
    return ans
}

/*
 Single Number
 Given a non-empty array of integers, every element appears twice except for one. Find that single one.
 */

func singleNumber(_ nums: [Int]) -> Int {
    var ans = 0
    
    for i in nums{
        ans ^= i
    }
    
    return ans
}

/*
    minimum sum subarray of length k
 */

func minsumSub(_ array: [Int], ofLength k: Int) -> Int {
    var ans = 0
    for i in 0..<k {
        ans += array[i]
    }
    var currentSum = ans
    
    for i in k..<array.count {
        currentSum += array[i] - array[i - k]
        ans = min(ans,currentSum)
    }
    return ans
}

let array = [9,8,11,45,2,4,54,5]
minsumSub(array, ofLength: 2)
