//
//  ContentView.swift
//  Api_test
//
//  Created by 이정훈 on 2023/03/01.
//

import SwiftUI

struct ContentView: View {
    @StateObject var busList: ViewModel = ViewModel()
    
    var body: some View {
        Button(action: {
            busList.printBusList()
        }, label: {
            Text("버스 도착 정보")
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
