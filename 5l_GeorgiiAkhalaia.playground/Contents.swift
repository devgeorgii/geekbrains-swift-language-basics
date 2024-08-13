import UIKit

// Перечисления для Car
enum EngineAction {
    case startEngine
    case stopEngine
}

enum WindowsAction {
    case openWindows
    case closeWindows
}

enum CargoAction {
    case loadCargo(volume: Double)
    case unloadCargo(volume: Double)
    case emptyCargo
}

enum Action {
    case engine(perform: EngineAction)
    case windows(perform: WindowsAction)
    case cargo(perform: CargoAction)
}

// Перечисления для TrunkCar
enum TrailerAction {
    case attachTrailer
    case detachTrailer
}

enum PowertrainAction {
    case setPowertrainTo4x2
    case setPowertrainTo4x4
    case setPowertrainTo6x6
    case setPowertrainTo6x4
    case setPowertrainTo8x8
}

enum TrunkCarAction {
    case trailer(perform: TrailerAction)
    case powertrain(perform: PowertrainAction)
}

// Перечисления для SportCar
enum NitroAction {
    case useNitro(nitro: Int)
    case refillNitro(nitro: Int)
}

enum TractionControlAction {
    case tractionControlOn
    case tractionControlOff
}

enum SportCarAction {
    case nitro(perform: NitroAction)
    case tractionControl(perform: TractionControlAction)
}

// 1. Создать протокол Car и описать свойства, общие для автомобилей, а также метод действия.
protocol Car {
    var make: String { get } // Марка
    var model: String { get } // Модель
    var yearOfIssue: Int { get } // Год выпуска
    var isEngineOn: Bool { get set } // Статус двигателя
    var areWindowsOpen: Bool { get set } // Статус окон
    var trunkVolume: Double { get } // Объём багажника/кузова
    var filledTrunkVolume: Double{ get set } // Уже заполненный объём багажника/кузова
    var leftTrunkVolume: Double { get } // Вычисляемая переменная - показывает сколько свободного объёма осталось в багажнике/кузове
    
    func action(_ action: Action)
}

// 2. Создать расширения для протокола Car и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окна, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
extension Car {
    var leftTrunkVolume: Double { // Вычисляемая переменная - показывает сколько свободного объёма осталось в багажнике/кузове
        return (trunkVolume - filledTrunkVolume)
    }
    
    mutating func action(_ action: Action) {
        switch action {
        case .engine(let perform):
            switch perform {
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
            }
        case .windows(let perform):
            switch perform {
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
            }
        case .cargo(let perform):
            switch perform {
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
            }
        }
    }
}

// 3. Создать два класса, имплементирующих протокол Car - TrunkCar и SportCar. Описать в них свойства, отличающиеся для спортивного автомобиля и грузовика.
class TrunkCar: Car {
    var make: String // Марка
    var model: String // Модель
    var yearOfIssue: Int // Год выпуска
    var isEngineOn: Bool // Статус двигателя
    var areWindowsOpen: Bool // Статус окон
    var trunkVolume: Double // Объём кузова
    var filledTrunkVolume: Double // Уже заполненный объём кузова
    var isTrailerAttached: Bool // Статус трейлера (прикреплён/откреплён)
    var powertrain: String = "4x4" // Статус трансмиссии (стандартное значенние 4x4)
    
    init(make: String, model: String, yearOfIssue: Int, isEngineOn: Bool, areWindowsOpen: Bool, trunkVolume: Double, filledTrunkVolume: Double, isTrailerAttached: Bool) {
        self.make = make
        self.model = model
        self.yearOfIssue = yearOfIssue
        self.isEngineOn = isEngineOn
        self.areWindowsOpen = areWindowsOpen
        self.trunkVolume = trunkVolume
        self.filledTrunkVolume = filledTrunkVolume
        self.isTrailerAttached = isTrailerAttached
    }
    
    func action(_ action: Action) {
        switch action {
        case .engine(let perform):
            switch perform {
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
            }
        case .windows(let perform):
            switch perform {
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
            }
        case .cargo(let perform):
            switch perform {
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
            }
        }
    }
    
    func actionTrunkCar(_ action: TrunkCarAction) {
        switch action {
        case .trailer(let perform):
            switch perform {
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
            }
        case .powertrain(let perform):
            switch perform {
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
            }
        }
    }
}

// 4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
extension TrunkCar: CustomStringConvertible {
    var engineStatusText: String {
        return(isEngineOn == true) ? "запущен" : "заглушен"
    }
    
    var windowsStatusText: String {
        return (areWindowsOpen == true) ? "открыты" : "закрыты"
    }
    
    var trailerStatusText: String {
        return (isTrailerAttached == true) ? "прикреплён" : "откреплён"
    }
    
    var description: String {
        return "Грузовик \(make) \(model), \(yearOfIssue) года выпуска, с объёмом кузова: \(trunkVolume) литров. У грузовика \(engineStatusText) двигатель и \(windowsStatusText) окна. Свободного места в кузове: \(leftTrunkVolume) литров, загружено \(filledTrunkVolume) литров. У грузовика \(trailerStatusText) трейлер, и установлена трансмиссия \(powertrain)\n"
    }
}

// 3. Создать два класса, имплементирующих протокол Car - TrunkCar и SportCar. Описать в них свойства, отличающиеся для спортивного автомобиля и грузовика.
class SportCar: Car {
    var make: String // Марка
    var model: String // Модель
    var yearOfIssue: Int // Год выпуска
    var isEngineOn: Bool // Статус двигателя
    var areWindowsOpen: Bool // Статус окон
    var trunkVolume: Double // Объём багажника
    var filledTrunkVolume: Double // Уже заполненный объём багажника
    var nitroCounter: Int = 5 // Счётчик нитро. Максимальное количество нитро 5
    var isTractionControlOn: Bool // Статус контроля тяги
    
    init(make: String, model: String, yearOfIssue: Int, isEngineOn: Bool, areWindowsOpen: Bool, trunkVolume: Double, filledTrunkVolume: Double, isTractionControlOn: Bool) {
        self.make = make
        self.model = model
        self.yearOfIssue = yearOfIssue
        self.isEngineOn = isEngineOn
        self.areWindowsOpen = areWindowsOpen
        self.trunkVolume = trunkVolume
        self.filledTrunkVolume = filledTrunkVolume
        self.isTractionControlOn = isTractionControlOn
    }
    
    func action(_ action: Action) {
        switch action {
        case .engine(let perform):
            switch perform {
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
            }
        case .windows(let perform):
            switch perform {
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
            }
        case .cargo(let perform):
            switch perform {
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
            }
        }
    }
    
    func actionSportCar(_ action: SportCarAction) {
        switch action {
        case .nitro(let perform):
            switch perform {
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
            }
        case .tractionControl(let perform):
            switch perform {
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
            }
        }
    }
}

// 4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
extension SportCar: CustomStringConvertible {
    var engineStatusText: String {
        (isEngineOn == true) ? "запущен" : "заглушен"
    }
    
    var windowsStatusText: String {
        (areWindowsOpen == true) ? "открыты" : "закрыты"
    }
    
    var tractionControlText: String {
        (isTractionControlOn == true) ? "включён" : "выключен"
    }
    
    var description: String {
        return "Спортивный автомобиль \(make) \(model), \(yearOfIssue) года выпуска, с объёмом багажника: \(trunkVolume) литров. У спортивного автомобиля \(engineStatusText) двигатель и \(windowsStatusText) окна. Свободного места в багажнике: \(leftTrunkVolume) литров, загружено \(filledTrunkVolume) литров. Контроль тяги \(tractionControlText), доступного нитро: \(nitroCounter)\n"
    }
}
