import UIKit

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
