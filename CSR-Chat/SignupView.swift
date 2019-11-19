//
//  SignupView.swift
//  CSR-Chat
//
//  Created by Cody Sugarman on 08/11/2019.
//  Copyright © 2019 csr.com. All rights reserved.
//

import SwiftUI

struct SignupView: View {
    
    @EnvironmentObject var session: FirebaseSession
    
    var body: some View {
        Text("Hello World")
    }
    
    func signUp() {
        session.signUp(email: "email", password: "password") { (result, error) in
            //If we run into an error while signing up...
            if error != nil {
                
            }
            //If our signup is successful...
            else {
                
            }
        }
    }
    
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
