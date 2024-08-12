import UIKit

// 3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определённого объёма.
// P.S. Я знаю что лучше разбивать действия по отдельным перечислениям, но так как в задании сказано "Добавить метод с одним аргументом типа перечисления", то сделал вот так.
enum Action {
    case startEngine
    case stopEngine
    case openWindows
    case closeWindows
    case loadCargo(volume: Double)
    case unloadCargo(volume: Double)
    case emptyCargo
}

// 1. Описать несколько структур - любой легковой автомобиль SportCar и любой грузовик TrunkCar.
// 2. Структуры должны содержать марку авто, год выпуска, объём багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объём багажника.
struct SportCar {
    let carMake: String //Марка автомобиля
    let carModel: String //Модель автомобиля
    let yearOfIssue: Int //Год выпуска
    var isEngineOn: Bool //Статус двигателя
    var areWindowsOpen: Bool //Статус окон
    let trunkVolume: Double //Объём багажника
    var filledTrunkVolume: Double //Уже заполненный объём багажника
    var leftTrunkVolume: Double { //Вычисляемая переменная - показывает сколько свободного объёма осталось в багажнике
        return (trunkVolume - filledTrunkVolume)
    }
    
    // 4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
    mutating func action(_ action: Action) {
        switch action {
        case .startEngine:
            isEngineOn = true
            print("Вы запустили двигатель в \(carMake) \(carModel)")
        case .stopEngine:
            isEngineOn = false
            print("Вы заглушили двигатель в \(carMake) \(carModel)")
        case .openWindows:
            areWindowsOpen = true
            print("Вы открыли окна в \(carMake) \(carModel)")
        case .closeWindows:
            areWindowsOpen = false
            print("Вы закрыли окна в \(carMake) \(carModel)")
        case .loadCargo(let volume):
            if volume <= 0 {
                print("Вы ввели не правильное значение. Нельзя добавить 0 или негативное значение.")
            } else if filledTrunkVolume + volume > trunkVolume {
                print("Вы не можете загрузить груз в \(carMake) \(carModel). Превышен лимит багажа.")
            } else if filledTrunkVolume + volume <= trunkVolume {
                filledTrunkVolume += volume
                print("Вы загрузили груз на \(volume) литров в \(carMake) \(carModel). Свободного места осталось: \(leftTrunkVolume) литров")
            }
        case .unloadCargo(let volume):
            if volume <= 0 {
                print("Вы ввели не правильное значение. Нельзя добавить 0 или негативное значение.")
            } else if volume > filledTrunkVolume {
                print("Вы пытаетесь выгрузить больше груза, чем есть в багажнике \(carMake) \(carModel). В багажнике груза на: \(filledTrunkVolume) литров")
            } else if filledTrunkVolume - volume >= 0 {
                filledTrunkVolume -= volume
                print("Вы выгрузили \(volume) литров груза из \(carMake) \(carModel). Свободного места осталось: \(leftTrunkVolume) литров")
            }
        case .emptyCargo:
            if leftTrunkVolume == trunkVolume {
                print("Багажник \(carMake) \(carModel) уже свободен")
            } else {
                filledTrunkVolume = 0
                print("Багажник \(carMake) \(carModel) освобождён")
            }
        }
    }
}

// 1. Описать несколько структур - любой легковой автомобиль SportCar и любой грузовик TrunkCar.
// 2. Структуры должны содержать марку авто, год выпуска, объём багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объём багажника.
struct TrunkCar {
    let trunkMake: String //Марка грузовика
    let trunkModel: String //Модель грузовика
    let yearOfIssue: Int //Год выпуска
    var isEngineOn: Bool //Статус двигателя
    var areWindowsOpen: Bool //Статус окон
    let bodyVolume: Double //Объём кузова
    var filledBodyVolume: Double //Уже заполненный объём кузова
    var leftBodyVolume: Double { //Вычисляемая переменная - показывает сколько свободного объёма осталось в кузове
        return (bodyVolume - filledBodyVolume)
    }
    
    // 4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
    mutating func action(_ action: Action) {
        switch action {
        case .startEngine:
            isEngineOn = true
            print("Вы запустили двигатель в \(trunkMake) \(trunkModel)")
        case .stopEngine:
            isEngineOn = false
            print("Вы заглушили двигатель в \(trunkMake) \(trunkModel)")
        case .openWindows:
            areWindowsOpen = true
            print("Вы открыли окна в \(trunkMake) \(trunkModel)")
        case .closeWindows:
            areWindowsOpen = false
            print("Вы закрыли окна в \(trunkMake) \(trunkModel)")
        case .loadCargo(let volume):
            if volume <= 0 {
                print("Вы ввели не правильное значение. Нельзя добавить 0 или негативное значение.")
            } else if filledBodyVolume + volume > bodyVolume {
                print("Вы не можете загрузить груз в \(trunkMake) \(trunkModel). Превышен лимит кузова.")
            } else if filledBodyVolume + volume <= bodyVolume {
                filledBodyVolume += volume
                print("Вы загрузили груз на \(volume) литров в \(trunkMake) \(trunkModel). Свободного места осталось: \(leftBodyVolume) литров")
            }
        case .unloadCargo(let volume):
            if volume <= 0 {
                print("Вы ввели не правильное значение. Нельзя добавить 0 или негативное значение.")
            } else if volume > filledBodyVolume {
                print("Вы пытаетесь выгрузить больше груза, чем есть в кузове \(trunkMake) \(trunkModel). В кузове груза на: \(filledBodyVolume) литров")
            } else if filledBodyVolume - volume >= 0 {
                filledBodyVolume -= volume
                print("Вы выгрузили \(volume) литров груза из \(trunkMake) \(trunkModel). Свободного места осталось: \(leftBodyVolume) литров")
            }
        case .emptyCargo:
            if leftBodyVolume == bodyVolume {
                print("Кузов \(trunkMake) \(trunkModel) уже свободен")
            } else {
                filledBodyVolume = 0
                print("Кузов \(trunkMake) \(trunkModel) освобождён")
            }
        }
    }
}

// 5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
var car = SportCar(carMake: "Volvo", carModel: "EX30", yearOfIssue: 2024, isEngineOn: false, areWindowsOpen: false, trunkVolume: 318, filledTrunkVolume: 10)
var car2 = SportCar(carMake: "BMW", carModel: "M4", yearOfIssue: 2024, isEngineOn: true, areWindowsOpen: false, trunkVolume: 339.802, filledTrunkVolume: 0)
var car3 = SportCar(carMake: "Toyota", carModel: "GR Yaris", yearOfIssue: 2020, isEngineOn: true, areWindowsOpen: true, trunkVolume: 174, filledTrunkVolume: 59.65)

car.action(.startEngine)
car.action(.loadCargo(volume: 400))
car.action(.loadCargo(volume: 150))

car2.action(.stopEngine)
car2.action(.unloadCargo(volume: 105.84))
car2.action(.emptyCargo)

car3.action(.closeWindows)
car3.action(.emptyCargo)


var trunk = TrunkCar(trunkMake: "Volvo", trunkModel: "FM Low Entry", yearOfIssue: 2024, isEngineOn: false, areWindowsOpen: false, bodyVolume: 445, filledBodyVolume: 0)
var trunk2 = TrunkCar(trunkMake: "CAT", trunkModel: "793F", yearOfIssue: 2009, isEngineOn: true, areWindowsOpen: true, bodyVolume: 142_000, filledBodyVolume: 89754.346)
var trunk3 = TrunkCar(trunkMake: "Ford", trunkModel: "1833D DC", yearOfIssue: 2019, isEngineOn: true, areWindowsOpen: false, bodyVolume: 399_516.6, filledBodyVolume: 516.6)

trunk.action(.startEngine)
trunk.action(.loadCargo(volume: 500))
trunk.action(.loadCargo(volume: 89.65))

trunk2.action(.stopEngine)
trunk2.action(.unloadCargo(volume: 9754.346))
trunk2.action(.emptyCargo)

trunk3.action(.openWindows)
trunk3.action(.unloadCargo(volume: 516.6))
trunk3.action(.emptyCargo)
