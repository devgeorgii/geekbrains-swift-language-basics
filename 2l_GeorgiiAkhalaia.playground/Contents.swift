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

// 5. (необязательно) Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов. Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.

/// Функция, которая добавляет в массив новое число Фибоначчи
/// - Parameters:
///   - array: Массив в который добавляем числа
///   - howManyNumbersToAdd: Сколько чисел добавить
///   - ifNotEmptyErase: Стереть массив, если в нём уже есть числа. Добавил эту функцию, так как в задании не уточняется начинать массив с [0, 1] как это обычно принято, или использовать уже доступные нам числа в массиве. Значение true - удаляет все числа из массива и заменяет их на [0, 1]. false - использует уже заданные числа.
func addFibonacciNumbers(array: [Int], howManyNumbersToAdd: Int, ifNotEmptyErase: Bool) -> [Int] {
    var functionArray: [Int] = array
    var eraseStatus: Bool = ifNotEmptyErase
    for count in 0..<howManyNumbersToAdd {
        if functionArray.count == 0 { // Если массив пустой, добавляем [0, 1]
            functionArray.append(contentsOf: [0, 1])
        } else if functionArray.count != 0 && eraseStatus == true { // Если в массиве уже есть числа и мы хотим стереть массив и установить [0, 1]
            functionArray.removeAll()
            functionArray.append(contentsOf: [0, 1])
            eraseStatus = false
        } else if functionArray.count == 1 { // Если в массиве есть одно число и мы не хотим стереть его. Добавляем 1 в массив
            functionArray.append(1)
        } else { // Если в массиве есть 2 числа или больше. Складываем последний и предпоследний элемент массива, и добавляем результат в массив
            let fn1 = functionArray.last
            let fn2 = functionArray[functionArray.count - 2]
            functionArray.append(fn1! + fn2)
        }
    }
    return functionArray
}

var fibonacciArray: [Int] = [1, 8]
fibonacciArray = addFibonacciNumbers(array: fibonacciArray, howManyNumbersToAdd: 50, ifNotEmptyErase: true)
print("Задача №5:\n\(fibonacciArray)\n")
