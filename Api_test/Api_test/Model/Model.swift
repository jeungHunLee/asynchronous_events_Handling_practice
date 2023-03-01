//
//  BusListModel.swift
//  Api_test
//
//  Created by 이정훈 on 2023/03/01.
//

import Foundation
import Combine

class Model: ObservableObject {
    var subscribtions = Set<AnyCancellable>()
    
    func fetchBusStop() {
        APIService.fetchBusStop()
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    print("finished")
                }
            } receiveValue: {
                print($0.response.body.items.item.nodeid)
            }
            .store(in: &subscribtions)
    }
    
    func fetchBusList() {
        APIService.fetchBusListAfterBusStop()
            .sink { compeletion in
                switch compeletion {
                case .failure(let error):
                    print(error)
                case .finished:
                    print("finished")
                }
            } receiveValue: {
                print($0.response.body.items.item)
            }
            .store(in: &subscribtions)
    }
}
