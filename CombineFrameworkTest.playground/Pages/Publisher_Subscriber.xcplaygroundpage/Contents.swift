import Combine

var numbers = [1, 2, 3, 4, 5]

//MARK: - Publisher
let pub = numbers.publisher    //publisher 생성

//MARK: - Subscriber
//sink로 publisher subscribe
let sub = pub.sink(receiveCompletion: {
    print("received completion: \($0)")
}, receiveValue: {
    print("received value: \($0)")
})
