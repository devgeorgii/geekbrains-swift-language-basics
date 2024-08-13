import UIKit

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

// 1. Создать протокол Car и описать свойства, общие для автомобилей, а также метод действия.
protocol Car {
    var make: String { get }
    var model: String { get }
    var yearOfIssue: Int { get }
    var isEngineOn: Bool { get set }
    var areWindowsOpen: Bool { get set }
    var trunkVolume: Double { get }
    var filledTrunkVolume: Double{ get set }
    var leftTrunkVolume: Double { get }
    
    func action(_ action: Action)
}

// 2. Создать расширения для протокола Car и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окна, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
extension Car {
    var leftTrunkVolume: Double {
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

