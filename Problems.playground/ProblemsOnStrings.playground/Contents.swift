import Foundation

/*
 Anagram
 */

func isAnagram(_ str1: String,_ str2: String) -> Bool {
    guar str1.length == str2.length else {
        return false
    }
    var dict = Dictionary<Character, Int>()
    str1.forEach{
        dict[$0, default: 0] += 1
    }
    str2.forEach{
        dict[$0, default: 0] -= 1
    }

    for (_, v ) in dict {
        if v != 0 {
            return false
        }
    }
    return true
}

isAnagram("Gudkesh", "shekGud")
