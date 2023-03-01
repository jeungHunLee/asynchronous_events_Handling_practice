//
//  ShowArriveBus.swift
//  Api_test
//
//  Created by 이정훈 on 2023/03/01.
//

import SwiftUI

struct ShowArriveBus: View {
    @Binding var showNext: Bool
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ShowArriveBus_Previews: PreviewProvider {
    static var previews: some View {
        ShowArriveBus(showNext: .constant(true))
    }
}
