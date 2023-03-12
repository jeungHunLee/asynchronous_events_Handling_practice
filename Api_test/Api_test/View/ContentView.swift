//
//  ContentView.swift
//  Api_test
//
//  Created by 이정훈 on 2023/03/01.
//

import SwiftUI

struct ContentView: View {
    @StateObject var busList: Model = Model()
    
    var body: some View {
        VStack {
            NavigationView {
                NavigationLink("버스 도착 정보", destination: {
                    ShowArriveBus()
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
