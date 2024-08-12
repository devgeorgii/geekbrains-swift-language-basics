import UIKit

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
}
