import UIKit

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

