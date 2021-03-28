import UIKit

// PART II: Wrtie a rank function
func rank(find target: Int, in array: [Int]) -> Int{
    var leftIndex = 0
    var rightIndex = array.count
    
    while leftIndex < rightIndex {
        
        let midIndex = leftIndex + (rightIndex - leftIndex) / 2
        
        if array[midIndex] < target {
            leftIndex = midIndex + 1
        }else if array[midIndex] > target {
            rightIndex = midIndex
        }else {  // find the target
            return midIndex
        }
    }
    // cannot find the index
    return -1
}

let testArray = [0, 1, 3, 5, 6, 8, 9, 10, 11]

print("Rank function Test: ")

// should return 3
var resultIndex = rank(find: 5, in: testArray)
print(resultIndex)

// should return 8
resultIndex = rank(find: 11, in: testArray)
print(resultIndex)

// should return -1
resultIndex = rank(find: 7, in: testArray)
print(resultIndex)

print("\n")

// PART III: Fraction Class
class Fraction {
    var numerator: Int = 0
    var denominator: Int = 1
    
    init(numerator: Int, denominator: Int) {
        self.numerator = numerator
        self.denominator = denominator
    }
    init(_ numerator: Int, over denominator: Int){
        self.numerator = numerator
        self.denominator = denominator
    }
    init() {} // default initializer
    
    func print() {
        Swift.print("\(numerator)/\(denominator)")
    }
    
    func reduce() {
        var u = abs(numerator)
        var v = denominator
        var r : Int
        while (v != 0) {
            r = u % v; u = v; v = r
        }
        numerator /= u
        denominator /= u
    }
    
    func add( _ f: Fraction) -> Fraction {
        let result: Fraction = Fraction()
        result.numerator = numerator * f.denominator + denominator * f.numerator
        result.denominator = denominator * f.denominator
        result.reduce()
        return result
    }
    
    func subtract(_ f: Fraction) -> Fraction {
        let result: Fraction = Fraction()
        result.numerator = numerator * f.denominator - denominator * f.numerator
        result.denominator = denominator * f.denominator
        result.reduce()
        return result
    }
    
    func multiply(_ f: Fraction) -> Fraction {
        let result: Fraction = Fraction()
        result.numerator = numerator * f.numerator
        result.denominator = denominator * f.denominator
        result.reduce()
        return result
    }
    
    func divide(_ f: Fraction) -> Fraction {
        let result: Fraction = Fraction()
        result.numerator = numerator * f.denominator
        result.denominator = denominator * f.numerator
        result.reduce()
        return result
    }
}

let f1 = Fraction(1, over: 2)
let f2 = Fraction(1, over: 3)

print("Fraction Test")


let f3 = f1.add(f2)
print("1/2 + 1/3 = 5/6")
f3.print()  // should be: 5/6

let f4 = f1.subtract(f2)
print("1/2 - 1/3 = 1/6")
f4.print()  // should be: 1/6

let f5 = f1.multiply(f2)
print("1/2 * 1/3 = 1/6")
f5.print()  // should be 1/6

let f6 = f1.divide(f2)
print("1/2 / 1/3 = 3/2")
f6.print()  // should be 3/2

for n in 0 ..< 10 {
    print(n)
}
