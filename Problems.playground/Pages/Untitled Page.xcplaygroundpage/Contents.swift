import Foundation

//MARK:- Reverse Integer

func reverse(_ x: Int) -> Int {
    
    var ans = 0
    var num = abs(x)
    
    while num > 0 {
        ans = (ans * 10) + (num % 10)
        num /= 10
    }
    
    
    return x < 0 ? -ans : ans
}

//reverse(-12367988798987)

//MARK: - product of array except self

func findProductOf( _ array: [Int]) -> [Int] {
    var ans = Array(repeating: 1, count: array.count)
    
    var start = 1
    var end = array.count - 1
    
    while start <= end {
        ans[start] = ans[start - 1] * array[start - 1]
        start += 1
    }
    var r = 1
    while (end) >= 0 {
        ans[end] = r * ans[end]
        r = r * array[end]
        end -= 1
    }
    
    return ans
}

//findProductOf([1,2,3,4,5])

//MARK: Roate an Array

func rotateArrayByOne(_ array: inout [Int]) {
    let temp = array[0]
    var i = 0
    while i < array.count - 1 {
        array[i] = array[i + 1]
        i += 1
    }
    array[i] = temp
}

func rotate(array: [Int], by distance: Int) -> [Int] {
    guard distance <= array.count else {
        return array
    }
    var ans = array
    var i = 0
    while i < distance {
         rotateArrayByOne(&ans)
        i += 1
    }
    return ans
}

//let ans = rotate(array: [1,2,3,4,5], by: 2)
//
//print(ans)

/*
 Given an array A of non-negative integers, return an array consisting of all the even elements of A, followed by all the odd elements of A.

 You may return any answer array that satisfies this condition.
 */

func sortArrayByParity(_ A: [Int]) -> [Int] {
    var start = 0
    var end = A.count - 1
    var array = A
    
    while start < end {
        if array[start] % 2 == 1{
            (array[start], array[end]) = (array[end], array[start])
            end -= 1
        } else {
            start += 1
        }
    }
    return array
}

/*
 The Hamming distance between two integers is the number of positions at which the corresponding bits are different.

 Given two integers x and y, calculate the Hamming distance.

 Note:
 0 ≤ x, y < 231.
 */

func hammingDistance(_ x: Int, _ y: Int) -> Int {
    
    var ans = 0
    
    var X = x
    var Y = y
    while X > 0 || Y > 0 {
        ans += ((X&1) ^ (Y&1))
         X >>= 1
        Y >>= 1
    }
    
    return ans
    
}

/*
 Write a class RecentCounter to count recent requests.

 It has only one method: ping(int t), where t represents some time in milliseconds.

 Return the number of pings that have been made from 3000 milliseconds ago until now.

 Any ping with time in [t - 3000, t] will count, including the current ping.

 It is guaranteed that every call to ping uses a strictly larger value of t than before.

  

 Example 1:

 Input: inputs = ["RecentCounter","ping","ping","ping","ping"], inputs = [[],[1],[100],[3001],[3002]]
 Output: [null,1,2,3,3]
  

 Note:

 Each test case will have at most 10000 calls to ping.
 Each test case will call ping with strictly increasing values of t.
 Each call to ping will have 1 <= t <= 10^9.
 */

class RecentCounter {

    init() {
        
    }
    private var window = [Int]()
    private var left = 0
    private var right = -1
    func ping(_ t: Int) -> Int {
        window.append(t)
        right += 1
        while (left <= right && window[left] < (t-3000)) {
            left += 1
        }
        return (right - left+1)
    }
}

/**
 * Your RecentCounter object will be instantiated and called as such:
 * let obj = RecentCounter()
 * let ret_1: Int = obj.ping(t)
 */

/*
 reverse bits
 */

func reverseBits(_ n: Int) -> Int {
    var num = n
    var ans = 0
    var i = 1
    while i <= 32 {
       if num & 1 == 1 {
           ans += 1 << (32 - i)
       }
        num >>= 1
        i += 1
    }
    return ans
}

/*
 Is num pow of 3
 */

func pow(_ base: Int, _ p: Int) -> Int {
    if (p == 0) {
        return 1
    }
    var tmp = pow(base, p>>1)
    tmp = tmp * tmp
    if (p&1 == 1) {
        return tmp*base;
    }
    return tmp
}

func isPowerOfThree(_ n: Int) -> Bool {
    var low = 0
    var high = 21
    while low <= high {
        let mid = (low + high) >> 1
        if (pow(3, mid) == n) {
        return true
        }
        if (pow(3, mid) > n) {
            high = mid-1
        } else {
            low = mid + 1
        }
        
    }
    return false
}

/*
 Compute x to the power n
 */

func myPow(_ x: Double, _ n: Int) -> Double {
    if n == 0 {
        return 1
    }
    
    var tmp = myPow(x, n >> 1)
    tmp *= tmp
    
    if (n & 1) == 1 {
        if n < 0 {
            return tmp / x
        }
        return tmp * x
    }
    return tmp
}

myPow(2, -2)
