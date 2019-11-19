//
//  ContentView.swift
//  CSR-Chat
//
//  Created by Cody Sugarman on 23/10/2019.
//  Copyright © 2019 csr.com. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var session = FirebaseSession()

    var body: some View {
        Text("Hello World")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
