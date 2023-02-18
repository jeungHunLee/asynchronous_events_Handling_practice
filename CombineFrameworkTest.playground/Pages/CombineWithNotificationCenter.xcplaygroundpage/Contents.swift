import Combine
import Foundation

//publisher가 전달할 notification
let notification: Notification.Name = Notification.Name("pass Notification")

//publisher
let publisher: NotificationCenter.Publisher = NotificationCenter.default.publisher(for: notification)

var subsribtionSet = Set<AnyCancellable>()    //subscribe 해제를 위한 set

//subscribe publisher
var subscribtion: AnyCancellable = publisher.sink(receiveCompletion: {
    print("received completion: \($0)")
}, receiveValue: {
    print("received value: \($0)")
})

//subscribe 해제
subscribtion.store(in: &subsribtionSet)

//publisher가 notification 전달
NotificationCenter.default.post(Notification(name: notification))
NotificationCenter.default.post(Notification(name: notification))

//subscribe 해제
//AnyCancellable 타입에 store 메서드로 set에 저장하거나 cancel 메서드로 set에 저장
//subscribtion.cancel()

NotificationCenter.default.post(Notification(name: notification))    //동작 x
