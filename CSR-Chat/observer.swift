//
//  Observer.swift
//  CSR-Chat
//
//  Created by Cody Sugarman on 08/11/2019.
//  Copyright © 2019 csr.com. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore

class observer: ObservableObject {
    
    @Published var msgs = [MSG]()
    
    init() {
        let db = Firestore.firestore()
        db.collection("msgs").addSnapshotListener { (snap, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            
            for i in snap!.documentChanges {
                
                if i.type == .added {
                    let name = i.document.get("name") as! String
                    let msg = i.document.get("msg") as! String
                    let email = i.document.get("email") as! String
                    let id = i.document.documentID

                    self.msgs.append(MSG(id: id, name: name, msg: msg, email: email))
                }
            }
        }
    }
    
    func addMsg(msg: String, user: String, email: String) {
        let db = Firestore.firestore()
        db.collection("msgs").addDocument(data: ["msg": msg, "name": user, "email": email]) { (err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            print("success")
        }
    }
}
