//
//  LoginView.swift
//  CSR-Chat
//
//  Created by Cody Sugarman on 08/11/2019.
//  Copyright © 2019 csr.com. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var session: FirebaseSession
    
    var body: some View {
        Text("Hello World")
    }
    
    func logIn() {
        session.logIn(email: "email", password: "password") { (result, error) in
            //If we run into an error while logging in...
            if error != nil {

            }
            //If login is successful...
            else {
               
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
