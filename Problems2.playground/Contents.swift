import UIKit

func gen(_ ind: Int, _ set: [Int], _ ssubset: [Int]) {
    guard (ind != set.count) else {
        print(ssubset)
        return
    }
    var subset: [Int] = ssubset
    //do not consider
    gen(ind+1, set, ssubset)
    
    //consider
    subset.append(set[ind])
    gen(ind+1, set, subset)
}

func calculateSubsets(_ set: [Int]) {
    for i in 0..<(1<<set.count){
        var subset = [Int]()
        for bit in 0..<(set.count) {
            if (i>>bit)&1 == 1 {
                subset.append(set[bit])
            }
        }
        print(subset)
    }
    //gen(0, set, [])
}

//calculateSubsets([1,2,3,4])


func maxArea(_ height: [Int]) -> Int {
    var maxArea = 0
    var start = 0
    var end = height.count - 1
    while start < end {
        if height[start] < height[end] {
            maxArea = max(maxArea, height[start] * (end - start))
            start += 1
        } else {
            maxArea = max(maxArea, height[end] * (end - start))
            end -= 1
        }
    }
   return maxArea
}
