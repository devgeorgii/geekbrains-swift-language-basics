import UIKit

// 1. Написать функцию, которая определяет, чётное число или нет.
func isEvenNumber(_ number: Int) -> Bool {
    return number % 2 == 0
}

let a = 84
isEvenNumber(a)
