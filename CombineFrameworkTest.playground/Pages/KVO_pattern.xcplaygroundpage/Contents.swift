import Combine
import Foundation

//KVO: Key-Value-Observing
class Person {
    @Published var age: Int
    
    init(_ age: Int) {
        self.age = age
    }
}

var personLee: Person = Person(99)
let publisher: Published<Int>.Publisher = personLee.$age
let subscriber: AnyCancellable = publisher.sink(receiveValue: {
    print("value changed: \($0)")
})

personLee.age = 20

/*
 class Person {
     var age: Int {
         didSet {
             print("changed value: \(age)")
         }
     }
     
     init(_ age: Int) {
         self.age = age
     }
 }

 var personLee: Person = Person(99)
 //assign으로 publisher로 부터 전달 받은 값을 바로 변경
 let cancellable = [20].publisher.assign(to: \.age, on: personLee)    //to: 변경할 프로퍼티, on: 대상 인스턴스
*/

/*
 class Person: NSObject {
     @objc dynamic var age: Int {
     }
     
     init(_ age: Int) {
         self.age = age
     }
 }
 
 var personLee: Person = Person(99)

 let cancellable = personLee.publisher(for: \.age)
     .sink(receiveValue: {
     print("changed value: \($0)")
 })

 personLee.age = 20
*/
