import UIKit

// 1. Реализовать свой тип коллекции "очередь" (queue) с использованием дженериков.
struct Queue<Element> {
    var queueArray: [Element] = []
    
    // запись в очередь
    mutating func enqueue(_ element: Element) {
        queueArray.append(element)
    }
    
    // снятие с очереди
    mutating func dequeue() -> Element? {
        return queueArray.isEmpty ? nil : queueArray.removeFirst()
    }
    
    // показывает первый элемент в очереди
    func peek() -> Element? {
        return queueArray.isEmpty ? nil : queueArray.first
    }
    
    // проверка очереди на наличие в ней элементов
    func empty() -> Bool {
        return queueArray.isEmpty ? true : false
    }
    
    // операция получения количества элементов в очереди
    func size() -> Int {
        return queueArray.count
    }
}
