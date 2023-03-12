//
//  APIService.swift
//  Api_test
//
//  Created by 이정훈 on 2023/03/01.
//

import Foundation
import Combine

let key = //비공개

struct APIService {
    //버스 정류장 API 호출
    static func fetchBusStop() -> AnyPublisher<BusStop, Error> {
        let apiUrl: String = "http://apis.data.go.kr/1613000/BusSttnInfoInqireService/getSttnNoList?serviceKey=\(key)&cityCode=31020&nodeNm=판교역.낙생육교.현대백화점&nodeNo=7489&numOfRows=10&pageNo=1&_type=json"
        let encodedURL = apiUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)    //한글 인코딩
        
        return URLSession.shared.dataTaskPublisher(for: URL(string: encodedURL!)!)
            .map { $0.data }
            .decode(type: BusStop.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    //버스 도착 예정 목록 API 호출
    static func fetchBusList(nodeId: String) -> AnyPublisher<BusList, Error> {
        let apiUrl: String = "http://apis.data.go.kr/1613000/ArvlInfoInqireService/getSttnAcctoArvlPrearngeInfoList?serviceKey=\(key)&cityCode=31020&nodeId=\(nodeId)&numOfRows=10&pageNo=1&_type=json"
        
        let encodedURL = apiUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        return URLSession.shared.dataTaskPublisher(for: URL(string: encodedURL)!)
            .map { $0.data }
            .decode(type: BusList.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    //두 API 연쇄 호출
    static func fetchBusListAfterBusStop() -> AnyPublisher<BusList, Error> {
        return fetchBusStop().flatMap { (busStop: BusStop) in
            fetchBusList(nodeId: busStop.response.body.items.item.nodeid)
                .eraseToAnyPublisher()
        }
        .eraseToAnyPublisher()
    }
}
