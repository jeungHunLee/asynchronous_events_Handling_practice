//
//  ContentView.swift
//  Api_test
//
//  Created by 이정훈 on 2023/03/01.
//

import SwiftUI

struct ContentView: View {
    @State var showNextPage: Bool = false
    @StateObject var busStop: Model = Model()
    @StateObject var busList: Model = Model()
    
    var body: some View {
        VStack {
            NavigationView {
                NavigationLink("BusStop 정보", destination: {
                    ShowArriveBus(showNext: $showNextPage)
                        .onAppear(perform: {
                            self.busList.fetchBusList()
                        })
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
