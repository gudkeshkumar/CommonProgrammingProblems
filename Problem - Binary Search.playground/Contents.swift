import Foundation

//MARK: - Find min and max index of sorted array

func findLeftIndex(_ array: [Int], of target: Int) -> Int {
    var ind = -1
    var left = 0
    var right = array.count - 1
    while left <= right {
        let mid = left + (right - left) / 2
        if array[mid] == target  {
            ind = mid
        }
        if array[mid] >= target {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    
    return ind
}

func findRightIndex(_ array: [Int], of target: Int) -> Int {
    var ind = -1
    var left = 0
    var right = array.count - 1
    
    while left <= right {
        let mid = left + (right - left) / 2
        if array[mid] == target  {
            ind = mid
        }
        if array[mid] <= target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return ind
}

func findMinAndMaxIndex(in array: [Int], of target: Int) -> [Int] {
    var leftInd = -1
    var rightInd = -1
    leftInd = findLeftIndex(array, of: target)
    rightInd = findRightIndex(array, of: target)
    return [leftInd, rightInd]
}

//let ans = findMinAndMaxIndex(in: [1,2,3,4,4,4,4,5,6,7,8], of: 4)
//print(ans)

//MARK: - Find minimum of sorted rotated array

func findMin(_ array: [Int]) -> Int {
    var left = 0
    var right = array.count - 1
    if left == right {
        return 0
    }
    while left < right {
        let mid = left + (right - left) / 2
        
        if mid > 0 && array[mid] < array[mid - 1] {
            return mid
        } else if array[mid] >= array[left] && array[mid] > array[right]{
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return left
}

let arr = [8,-1,1,2,3,4,5,6,7]
findMin(arr)

func find( num: Int, array: [Int]) -> Int {
    var left = 0
    var right = array.count - 1
    let start = findMin(array)
    left = 0
    right = array.count - 1
    
    if num >= array[start] && num < array[right] {
        left = start
    } else {
        right = start - 1
    }
    while  left <= right {
        let mid = left + (right - left) / 2
        if array[mid] == num {
           return mid
        } else if array[mid] < num {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    
    return -1
}

let ind = find(num: 4, array: arr)
print(ind)

func subarraySum(_ nums: [Int], _ k: Int) -> Int {
    let n = nums.count - 1
    var ans = 0
    var dict = [Int:Int]()
    var sum = 0
    dict[0] = 1
    for i in 0...n {
        sum += nums[i]
        let comp = sum - k
        ans += dict[comp, default: 0]
        dict[sum, default: 0] += 1
    }
        
    return ans
}

let ans = subarraySum([1,1,1], 2)

