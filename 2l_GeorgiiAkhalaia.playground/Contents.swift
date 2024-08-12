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
