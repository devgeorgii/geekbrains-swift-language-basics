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
    
    // 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
    func filter(_ transform: (Element) -> Bool) -> [Element] {
        var transformedArray: [Element] = []
        for element in queueArray {
            if transform(element) {
                transformedArray.append(element)
            }
        }
        return transformedArray
    }
    
    func map(_ transform: (Element) -> Element) -> [Element] {
        var transformedArray: [Element] = []
        for element in queueArray {
            let transformedElement = transform(element)
            transformedArray.append(transformedElement)
        }
        return transformedArray
    }
    
    // 3. (необязательно) Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
    subscript(index: Int) -> Element? {
        get {
            guard !queueArray.isEmpty, index >= 0, index <= queueArray.count - 1 else {
                print("Индекс вне диапазона")
                return nil
            }
            return queueArray[index]
        }
        set {
            guard let newValue = newValue, index >= 0, index <= queueArray.count - 1 else {
                return
            }
            queueArray[index] = newValue
        }
    }
}

var queue = Queue<String>()
queue.enqueue("Georgii")
queue.enqueue("Bob")
queue.enqueue("Igor")
queue.enqueue("Ivan")
print(queue)
queue.dequeue()
print(queue)
queue.peek()
queue.empty()
queue.size()

let greetingMessage = queue.map {"Hey, " + $0}
print(greetingMessage)

let filteredQueue = queue.filter {$0.count == 4}
print(filteredQueue)

print(queue[3])
queue[4]
queue[5] = "Misha"
print(queue)
