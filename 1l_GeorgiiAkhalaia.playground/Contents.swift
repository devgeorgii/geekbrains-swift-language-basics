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
