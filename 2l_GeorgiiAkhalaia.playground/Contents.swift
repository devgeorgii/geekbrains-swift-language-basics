import UIKit

// 1. Написать функцию, которая определяет, чётное число или нет.
func isEvenNumber(_ number: Int) -> Bool {
    return number % 2 == 0
}

let a = 84
isEvenNumber(a)

// 2. Написать функцию, которая определяет, делится ли число без остатка на 3.
func isDivisibleByThree(_ number: Int) -> Bool {
    return number % 3 == 0
}

let b = 99
isDivisibleByThree(b)

// 3. Создать возрастающий массив из 100 чисел.
var array: [Int] = Array(stride(from: 0, to: 100, by: 1))

print("Задача №3:\n\(array)\n")

// 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
for count in array {
    if isEvenNumber(count) == true || isDivisibleByThree(count) == false {
        array.remove(at: array.firstIndex(of: count)!)
    }
}

print("Задача №4:\n\(array)\n")
