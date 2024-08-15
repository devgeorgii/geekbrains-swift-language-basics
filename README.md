> [!NOTE]
> For English [click here](#Swift-language-basics), or scroll down.

# Основы языка Swift
Это репозиторий с моими выполненными домашними заданиями по курсу "Основы языка Swift" от GeekBrains.

## Урок 1. Введение в программирование

1. Решить квадратное уравнение.
2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
3. (необязательно) Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

[Решение ->](1l_GeorgiiAkhalaia.playground/Contents.swift)

## Урок 2. Синтаксис и основные операторы Swift

1. Написать функцию, которая определяет, чётное число или нет.
2. Написать функцию, которая определяет, делится ли число без остатка на 3.
3. Создать возрастающий массив из 100 чисел.
4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
5. (необязательно) Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.
    - Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.
6. (необязательно) Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
    1. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
    2. Пусть переменная p изначально равна двум - первому простому числу.
    3. Зачеркнуть в списке числа от 2 + p до n, считая шагом p.
    4. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
    5. Повторять шаги iii и iv, пока возможно.

[Решение ->](2l_GeorgiiAkhalaia.playground/Contents.swift)

## Урок 3. Комплексные типы данных.

1. Описать несколько структур - любой легковой автомобиль SportCar и любой грузовик TrunkCar.
2. Структуры должны содержать марку авто, год выпуска, объём багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объём багажника.
3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определённого объёма.
4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
6. Вывести значения свойств экземпляров в консоль.

[Решение ->](3l_GeorgiiAkhalaia.playground/Contents.swift)

## Урок 4. Введение в ООП - объектно-ориентированное программирование

1. Описать класс Car с общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
2. Описать пару его наследников TrunkCar и SportCar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет TrunkCar, а какие - SportCar. Добавить эти действия в перечисление.
4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
5. Создать несколько объектов каждого класса. Применить к ним различные действия.
6. Вывести значения свойств экземпляров в консоль.

[Решение ->](4l_GeorgiiAkhalaia.playground/Contents.swift)

## Урок 5. ООП: требование к классам, протоколы, расширения, полиморфизм, композиция

1. Создать протокол Car и описать свойства, общие для автомобилей, а также метод действия.
2. Создать расширения для протокола Car и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окна, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
3. Создать два класса, имплементирующих протокол Car - TrunkCar и SportCar. Описать в них свойства, отличающиеся для спортивного автомобиля и грузовика.
4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
5. Создать несколько объектов каждого класса. Применить к ним различные действия.
6. Вывести сами объекты в консоль.

[Решение ->](5l_GeorgiiAkhalaia.playground/Contents.swift)

## Урок 6. Продвинутое ООП

1. Реализовать свой тип коллекции "очередь" (queue) с использованием дженериков.
2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
3. (необязательно) Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

[Решение ->](6l_GeorgiiAkhalaia.playground/Contents.swift)

## Урок 7. Управление ошибками в приложениях

1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.
2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.

# Swift language basics
This is a repository with my completed homework assignments for the course "Swift language basics" from GeekBrains.

## Lesson 1. Introduction to programming

1. Solve a quadratic equation.
2. Given the legs of a right triangle. Find the area, perimeter, and hypotenuse of the triangle.
3. (optional) The user enters the amount of the deposit in the bank and the annual interest. Find the deposit amount after 5 years.

[Solution ->](1l_GeorgiiAkhalaia.playground/Contents.swift)

## Lesson 2. Syntax and basic operators of Swift

1. Write a function that determines if a number is even or not.
2. Write a function that determines whether a number is divisible by 3 without a remainder.
3. Create an increasing array of 100 numbers.
4. Remove all even numbers and all numbers that are not divisible by 3 from this array.
5. (optional) Write a function that adds a new Fibonacci number to the array and use it to add 50 elements.
    - Fibonacci numbers are defined by the ratios Fn=Fn-1 + Fn-2.
6. (optional) Fill an array of 100 elements with different prime numbers. A natural number greater than one is called prime if it is divisible only by itself and one. To find all prime numbers no greater than a given number n, following the method of Eratosthenes, you need to perform the following steps:
    1. Write out in a row all the integers from two to n (2, 3, 4, ..., n).
    2. Let the variable p initially be equal to two, the first prime number.
    3. Cross out the numbers from 2 + p to n in the list, counting in increments of p.
    4. Find the first non-crossed-out number in the list that is greater than p and assign this number to the variable p.
    5. Repeat steps iii and iv as long as possible.

[Solution ->](2l_GeorgiiAkhalaia.playground/Contents.swift)

## Lesson 3. Complex data types.

1. Describe several structures - any SportCar and any TrunkCar.
2. The structures should contain the car brand, year of manufacture, trunk/body volume, whether the engine is running, whether the windows are open, and the filled trunk volume.
3. Describe an enumeration with possible actions with a car: start/stop the engine, open/close the windows, load/unload cargo of a certain volume from the body/trunk.
4. Add a method with one argument of the enumeration type to the structures, which will change the structure properties depending on the action.
5. Initialize several instances of the structures. Apply different actions to them.
6. Print the values ​​of the instance properties to the console.

[Solution ->](3l_GeorgiiAkhalaia.playground/Contents.swift)

## Lesson 4. Introduction to OOP - Object-Oriented Programming

1. Describe the Car class with common properties of cars and an empty action method, similar to the previous task.
2. Describe a pair of its descendants, TrunkCar and SportCar. Think about the distinctive properties of these cars. Describe the properties specific to each descendant.
3. Take the enum with actions on a car from the previous lesson. Think about the special actions of TrunkCar and SportCar. Add these actions to the enumeration.
4. In each subclass, override the action method with a car, in accordance with its class.
5. Create several objects of each class. Apply different actions to them.
6. Print the values ​​of the instance properties to the console.

[Solution ->](4l_GeorgiiAkhalaia.playground/Contents.swift)

## Lesson 5. OOP: requirements for classes, protocols, extensions, polymorphism, composition

1. Create a Car protocol and describe the properties common to cars, as well as the action method.
2. Create extensions for the Car protocol and implement methods for specific actions with the car: open/close windows, start/stop the engine, etc. (one method per action, implement only those actions whose implementation is common to all cars).
3. Create two classes implementing the Car protocol - TrunkCar and SportCar. Describe in them the properties that differ for a sports car and a truck.
4. For each class, write an extension implementing the CustomStringConvertible protocol.
5. Create several objects of each class. Apply various actions to them.
6. Print the objects themselves to the console.

[Solution ->](5l_GeorgiiAkhalaia.playground/Contents.swift)

## Lesson 6. Advanced OOP

1. Implement your own "queue" collection type using generics.
2. Add several higher-order methods useful for this collection (example: filter for arrays)
3. (optional) Add your own subscript that will return nil if a non-existent index is accessed.

[Solution ->](6l_GeorgiiAkhalaia.playground/Contents.swift)

## Lesson 7. Managing Errors in Applications

1. Come up with a class whose methods can fail and return either a value or an Error?. Implement their call and handle the result of the method using the if let or guard let construct.
2. Come up with a class whose methods can throw errors. Implement several throws functions. Call them and handle the result of the call using the try/catch construct.
