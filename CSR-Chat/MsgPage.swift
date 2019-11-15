//
//  MsgPage.swift
//  CSR-Chat
//
//  Created by Cody Sugarman on 08/11/2019.
//  Copyright © 2019 csr.com. All rights reserved.
//

import SwiftUI

struct MsgPage : View {
    
    var session: FirebaseSession
    @ObservedObject var newSession = FirebaseSession()
    
    var body : some View {
        Text("Hello World")
    }
}

struct MsgPage_Previews: PreviewProvider {
    static var previews: some View {
        MsgPage(session: FirebaseSession())
    }
}
