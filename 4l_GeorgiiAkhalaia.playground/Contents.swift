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
    
    // 4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
    // P.S. Знаю что лучше использовать несколько перечислений, но так как задание говорит сделать только одно перечисление, то делаю так.
    override func action(_ action: Action) {
        switch action {
        case .startEngine:
            if isEngineOn == true {
                print("Двигатель уже запущен у \(make) \(model)")
            } else {
                isEngineOn = true
                print("Вы запустили двигатель в \(make) \(model)")
            }
        case .stopEngine:
            if isEngineOn == false {
                print("Двигатель уже заглушен у \(make) \(model)")
            } else {
                isEngineOn = false
                print("Вы заглушили двигатель в \(make) \(model)")
            }
        case .openWindows:
            if areWindowsOpen == true {
                print("Окна уже открыты у \(make) \(model)")
            } else {
                areWindowsOpen = true
                print("Вы открыли окна в \(make) \(model)")
            }
        case .closeWindows:
            if areWindowsOpen == false {
                print("Окна уже закрыты у \(make) \(model)")
            } else {
                areWindowsOpen = false
                print("Вы закрыли окна в \(make) \(model)")
            }
        case .loadCargo(let volume):
            if volume <= 0 {
                print("Вы ввели не правильное значение. Нельзя добавить 0 или негативное значение.")
            } else if filledTrunkVolume + volume > trunkVolume {
                print("Вы не можете загрузить груз в \(make) \(model). Превышен лимит кузова.")
            } else if filledTrunkVolume + volume <= trunkVolume {
                filledTrunkVolume += volume
                print("Вы загрузили груз на \(volume) литров в \(make) \(model). Свободного места осталось: \(leftTrunkVolume) литров")
            }
        case .unloadCargo(let volume):
            if volume <= 0 {
                print("Вы ввели не правильное значение. Нельзя добавить 0 или негативное значение.")
            } else if volume > filledTrunkVolume {
                print("Вы пытаетесь выгрузить больше груза, чем есть в кузове \(make) \(model). В кузове груза на: \(filledTrunkVolume) литров")
            } else if filledTrunkVolume - volume >= 0 {
                filledTrunkVolume -= volume
                print("Вы выгрузили \(volume) литров груза из \(make) \(model). Свободного места осталось: \(leftTrunkVolume) литров")
            }
        case .emptyCargo:
            if leftTrunkVolume == trunkVolume {
                print("Кузов \(make) \(model) уже свободен")
            } else {
                filledTrunkVolume = 0
                print("Кузов \(make) \(model) освобождён")
            }
        case .attachTrailer:
            if isTrailerAttached == true {
                print("Трейлер уже прикреплён к \(make) \(model)")
            } else {
                isTrailerAttached = true
                print("Вы прикрепили трейлер к \(make) \(model)")
            }
        case .detachTrailer:
            if isTrailerAttached == false {
                print("Трейлер уже откреплён от \(make) \(model)")
            } else {
                isTrailerAttached = false
                print("Вы открепили трейлер от \(make) \(model)")
            }
        case .setPowertrainTo4x2:
            if powertrain == "4x2" {
                print("Трансмиссия у \(make) \(model) и так уже установлена на \"4x2\"")
            } else {
                powertrain = "4x2"
                print("Вы установили трансмиссию \"4x2\" для \(make) \(model)")
            }
        case .setPowertrainTo4x4:
            if powertrain == "4x4" {
                print("Трансмиссия у \(make) \(model) и так уже установлена на \"4x4\"")
            } else {
                powertrain = "4x4"
                print("Вы установили трансмиссию \"4x4\" для \(make) \(model)")
            }
        case .setPowertrainTo6x6:
            if powertrain == "6x6" {
                print("Трансмиссия у \(make) \(model) и так уже установлена на \"6x6\"")
            } else {
                powertrain = "6x6"
                print("Вы установили трансмиссию \"6x6\" для \(make) \(model)")
            }
        case .setPowertrainTo6x4:
            if powertrain == "6x4" {
                print("Трансмиссия у \(make) \(model) и так уже установлена на \"6x4\"")
            } else {
                powertrain = "6x4"
                print("Вы установили трансмиссию \"6x4\" для \(make) \(model)")
            }
        case .setPowertrainTo8x8:
            if powertrain == "8x8" {
                print("Трансмиссия у \(make) \(model) и так уже установлена на \"8x8\"")
            } else {
                powertrain = "8x8"
                print("Вы установили трансмиссию \"8x8\" для \(make) \(model)")
            }
        default:
            print("Вы пытаетесь применить действие не доступное для данной машины.")
        }
    }
    
    // 6. Вывести значения свойств экземпляров в консоль.
    func describe() {
        let engineStatusText: String = (isEngineOn == true) ? "запущен" : "заглушен"
        let windowsStatusText: String = (areWindowsOpen == true) ? "открыты" : "закрыты"
        let trailerStatusText: String = (isTrailerAttached == true) ? "прикреплён" : "откреплён"
        print("Грузовик \(make) \(model), \(yearOfIssue) года выпуска, с объёмом кузова: \(trunkVolume) литров. У грузовика \(engineStatusText) двигатель и \(windowsStatusText) окна. Свободного места в кузове: \(leftTrunkVolume) литров, загружено \(filledTrunkVolume) литров. У грузовика \(trailerStatusText) трейлер, и установлена трансмиссия \(powertrain)\n")
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
    
    // 4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
    // P.S. Знаю что лучше использовать несколько перечислений, но так как задание говорит сделать только одно перечисление, то делаю так.
    override func action(_ action: Action) {
        switch action {
        case .startEngine:
            if isEngineOn == true {
                print("Двигатель уже запущен у \(make) \(model)")
            } else {
                isEngineOn = true
                print("Вы запустили двигатель в \(make) \(model)")
            }
        case .stopEngine:
            if isEngineOn == false {
                print("Двигатель уже заглушен у \(make) \(model)")
            } else {
                isEngineOn = false
                print("Вы заглушили двигатель в \(make) \(model)")
            }
        case .openWindows:
            if areWindowsOpen == true {
                print("Окна уже открыты у \(make) \(model)")
            } else {
                areWindowsOpen = true
                print("Вы открыли окна в \(make) \(model)")
            }
        case .closeWindows:
            if areWindowsOpen == false {
                print("Окна уже закрыты у \(make) \(model)")
            } else {
                areWindowsOpen = false
                print("Вы закрыли окна в \(make) \(model)")
            }
        case .loadCargo(let volume):
            if volume <= 0 {
                print("Вы ввели не правильное значение. Нельзя добавить 0 или негативное значение.")
            } else if filledTrunkVolume + volume > trunkVolume {
                print("Вы не можете загрузить груз в \(make) \(model). Превышен лимит багажа.")
            } else if filledTrunkVolume + volume <= trunkVolume {
                filledTrunkVolume += volume
                print("Вы загрузили груз на \(volume) литров в \(make) \(model). Свободного места осталось: \(leftTrunkVolume) литров")
            }
        case .unloadCargo(let volume):
            if volume <= 0 {
                print("Вы ввели не правильное значение. Нельзя добавить 0 или негативное значение.")
            } else if volume > filledTrunkVolume {
                print("Вы пытаетесь выгрузить больше груза, чем есть в багажнике \(make) \(model). В багажнике груза на: \(filledTrunkVolume) литров")
            } else if filledTrunkVolume - volume >= 0 {
                filledTrunkVolume -= volume
                print("Вы выгрузили \(volume) литров груза из \(make) \(model). Свободного места осталось: \(leftTrunkVolume) литров")
            }
        case .emptyCargo:
            if leftTrunkVolume == trunkVolume {
                print("Багажник \(make) \(model) уже свободен")
            } else {
                filledTrunkVolume = 0
                print("Багажник \(make) \(model) освобождён")
            }
        case .useNitro(let nitro):
            if nitro <= 0 {
                print("Вы ввели не правильное значение. Нельзя использовать 0 или негативное значение.")
            } else if nitro > nitroCounter {
                print("Вы не можете использовать больше нитро чем у вас есть. Нитро в наличии: \(nitroCounter)")
            } else {
                nitroCounter -= nitro
                print("Вы использовали \(nitro) нитро. Нитро осталось: \(nitroCounter)")
            }
        case .refillNitro(let nitro):
            if nitro <= 0 {
                print("Вы ввели не правильное значение. Нельзя использовать 0 или негативное значение.")
            } else if nitro + nitroCounter > 5 {
                print("Вы не можете добавить столько нитро. Максимальное количество не может быть больше 5! Нитро в наличии: \(nitroCounter)")
            } else {
                nitroCounter += nitro
                print("Вы добавили \(nitro) нитро. Нитро в наличии: \(nitroCounter)")
            }
        case .tractionControlOn:
            if isTractionControlOn == true {
                print("Контроль тяги у \(make) \(model) и так уже включён")
            } else {
                isTractionControlOn = true
                print("Вы включили контроль тяги для \(make) \(model)")
            }
        case .tractionControlOff:
            if isTractionControlOn == false {
                print("Контроль тяги у \(make) \(model) и так уже выключен")
            } else {
                isTractionControlOn = false
                print("Вы выключили контроль тяги для \(make) \(model)")
            }
        default:
            print("Вы пытаетесь применить действие не доступное для данной машины.")
        }
    }
    
    // 6. Вывести значения свойств экземпляров в консоль.
    func describe() {
        let engineStatusText: String = (isEngineOn == true) ? "запущен" : "заглушен"
        let windowsStatusText: String = (areWindowsOpen == true) ? "открыты" : "закрыты"
        let tractionControlText: String = (isTractionControlOn == true) ? "включён" : "выключен"
        print("Спортивный автомобиль \(make) \(model), \(yearOfIssue) года выпуска, с объёмом багажника: \(trunkVolume) литров. У спортивного автомобиля \(engineStatusText) двигатель и \(windowsStatusText) окна. Свободного места в багажнике: \(leftTrunkVolume) литров, загружено \(filledTrunkVolume) литров. Контроль тяги \(tractionControlText), доступного нитро: \(nitroCounter)\n")
    }
}

// 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
// 6. Вывести значения свойств экземпляров в консоль.
var sportCar = SportCar(make: "Ferrari", model: "306FX", yearOfIssue: 2019, isEngineOn: true, areWindowsOpen: false, trunkVolume: 140, filledTrunkVolume: 23.68, isTractionControlOn: true)
var sportCar2 = SportCar(make: "McLaren", model: "Artura Spider", yearOfIssue: 2025, isEngineOn: false, areWindowsOpen: true, trunkVolume: 160, filledTrunkVolume: 0, isTractionControlOn: true)
var sportCar3 = SportCar(make: "Lamborghini", model: "Revuelto", yearOfIssue: 2023, isEngineOn: true, areWindowsOpen: true, trunkVolume: 150, filledTrunkVolume: 87, isTractionControlOn: false)

sportCar.describe()
sportCar.action(.closeWindows)
sportCar.action(.useNitro(nitro: 3))
sportCar.action(.refillNitro(nitro: 10))
sportCar.action(.refillNitro(nitro: 2))
sportCar.action(.tractionControlOn)
sportCar.action(.tractionControlOff)
sportCar.describe()

sportCar2.describe()
sportCar2.action(.attachTrailer)
sportCar2.action(.closeWindows)
sportCar2.action(.unloadCargo(volume: 17))
sportCar2.describe()

sportCar3.describe()
sportCar3.action(.stopEngine)
sportCar3.action(.emptyCargo)
sportCar3.action(.tractionControlOn)
sportCar3.action(.setPowertrainTo6x4)
sportCar3.describe()

var trunkCar = TrunkCar(make: "Volvo", model: "FM Low Entry", yearOfIssue: 2024, isEngineOn: false, areWindowsOpen: false, trunkVolume: 445, filledTrunkVolume: 0, isTrailerAttached: false)
var trunkCar2 = TrunkCar(make: "CAT", model: "793F", yearOfIssue: 2009, isEngineOn: true, areWindowsOpen: true, trunkVolume: 142000, filledTrunkVolume: 89754.346, isTrailerAttached: true)
var trunkCar3 = TrunkCar(make: "Ford", model: "1833D DC", yearOfIssue: 2019, isEngineOn: true, areWindowsOpen: false, trunkVolume: 399516.6, filledTrunkVolume: 516.6, isTrailerAttached: true)

trunkCar.describe()
trunkCar.action(.attachTrailer)
trunkCar.action(.setPowertrainTo4x4)
trunkCar.action(.setPowertrainTo6x4)
trunkCar.describe()

trunkCar2.describe()
trunkCar2.action(.stopEngine)
trunkCar2.action(.useNitro(nitro: 4))
trunkCar2.action(.closeWindows)
trunkCar2.action(.detachTrailer)
trunkCar2.describe()

trunkCar3.describe()
trunkCar3.action(.startEngine)
trunkCar3.action(.openWindows)
trunkCar3.action(.emptyCargo)
trunkCar3.action(.attachTrailer)
trunkCar3.action(.loadCargo(volume: 400000))
trunkCar3.describe()
