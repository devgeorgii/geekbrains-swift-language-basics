import UIKit

// 3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет TrunkCar, а какие - SportCar. Добавить эти действия в перечисление.
enum Action {
    case startEngine
    case stopEngine
    case openWindows
    case closeWindows
    case loadCargo(volume: Double)
    case unloadCargo(volume: Double)
    case emptyCargo
    case attachTrailer
    case detachTrailer
    case setPowertrainTo4x2
    case setPowertrainTo4x4
    case setPowertrainTo6x6
    case setPowertrainTo6x4
    case setPowertrainTo8x8
    case useNitro(nitro: Int)
    case refillNitro(nitro: Int)
    case tractionControlOn
    case tractionControlOff
}

// 1. Описать класс Car с общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
class Car {
    let make: String // Марка
    let model: String // Модель
    let yearOfIssue: Int // Год выпуска
    var isEngineOn: Bool // Статус двигателя
    var areWindowsOpen: Bool // Статус окон
    let trunkVolume: Double // Объём багажника
    var filledTrunkVolume: Double // Уже заполненный объём багажника/кузова
    var leftTrunkVolume: Double { // Вычисляемая переменная - показывает сколько свободного объёма осталось в багажнике/кузове
        return (trunkVolume - filledTrunkVolume)
    }
    
    init(make: String, model: String, yearOfIssue: Int, isEngineOn: Bool, areWindowsOpen: Bool, trunkVolume: Double, filledTrunkVolume: Double) {
        self.make = make
        self.model = model
        self.yearOfIssue = yearOfIssue
        self.isEngineOn = isEngineOn
        self.areWindowsOpen = areWindowsOpen
        self.trunkVolume = trunkVolume
        self.filledTrunkVolume = filledTrunkVolume
    }
    
    func action(_ action: Action) { }
}

// 2. Описать пару его наследников TrunkCar и SportCar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
class TrunkCar: Car {
    var isTrailerAttached: Bool // Статус крепления трейлера
    var powertrain: String = "4x4" // Статус трансмиссии. Стандартное значение 4x4
    
    init(make: String, model: String, yearOfIssue: Int, isEngineOn: Bool, areWindowsOpen: Bool, trunkVolume: Double, filledTrunkVolume: Double, isTrailerAttached: Bool) {
        self.isTrailerAttached = isTrailerAttached
        super.init(make: make, model: model, yearOfIssue: yearOfIssue, isEngineOn: isEngineOn, areWindowsOpen: areWindowsOpen, trunkVolume: trunkVolume, filledTrunkVolume: filledTrunkVolume)
    }
}

// 2. Описать пару его наследников TrunkCar и SportCar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
class SportCar: Car {
    var nitroCounter: Int = 5 // Счётчик нитро. Максимальное количество 5
    var isTractionControlOn: Bool // Статус контроля тяги
    
    init(make: String, model: String, yearOfIssue: Int, isEngineOn: Bool, areWindowsOpen: Bool, trunkVolume: Double, filledTrunkVolume: Double, isTractionControlOn: Bool) {
        self.isTractionControlOn = isTractionControlOn
        super.init(make: make, model: model, yearOfIssue: yearOfIssue, isEngineOn: isEngineOn, areWindowsOpen: areWindowsOpen, trunkVolume: trunkVolume, filledTrunkVolume: filledTrunkVolume)
    }
}
