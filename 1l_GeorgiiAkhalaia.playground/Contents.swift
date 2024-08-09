import UIKit

// 1. Решить квадратное уравнение.

// Введите коэффициенты
let a: Double = 1
let b: Double = -6
let c: Double = 9

// Вычисляем дискриминант
let discriminant: Double = pow(b, 2) - (4 * a * c)

print("Задача №1:")

// Вычисляем корни
if discriminant < 0 {
    print("Дискриминант: \(discriminant). Дискриминант меньше 0. Корней нет.\n")
} else if discriminant == 0 {
    let x1: Double = -(b / 2 * a)
    print("Дискриминант: \(discriminant). Дискриминант равен 0. Есть один корень. x1 = \(x1)\n")
} else {
    let x1: Double = (-b - sqrt(discriminant)) / (2 * a)
    let x2: Double = (-b + sqrt(discriminant)) / (2 * a)
    print("Дискриминант: \(discriminant). Дискриминант больше 0. Есть два корня. x1 = \(x1), x2 = \(x2)\n")
}

// 2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

// Введите катеты
let cathetusA: Double = 9
let cathetusB: Double = 21

// Вычисляем площадь
let area: Double = (cathetusA * cathetusB) / 2

// Вычисляем гипотенузу
let hypotenuse: Double = sqrt(pow(cathetusA, 2) + pow(cathetusB, 2))

// Вычисляем периметр
let perimeter: Double = cathetusA + cathetusB + hypotenuse

print("Задача №2:\nКатет a - \(cathetusA), катет b - \(cathetusB). Площадь - \(area). Гипотенуза - \(hypotenuse). Периметр - \(perimeter)\n")
