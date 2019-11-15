//
//  FirebaseSession.swift
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseDatabase

class FirebaseSession: ObservableObject {
    
    @Published var msgs = [Msg]()

    @Published var session: User!
    @Published var isLoggedIn: Bool?
    @Published var username: String?
    @Published var email: String?
    
    var ref: DatabaseReference = Database.database().reference(withPath: "\(String(describing: Auth.auth().currentUser?.uid ?? "Error"))")

    
    func getUser() {
        _ = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                self.session = User(uid: user.uid, displayName: user.displayName, email: user.email)
                self.isLoggedIn = true
            } else {
                self.isLoggedIn = false
                self.session = nil
            }
        }
    }
    
    func logIn(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        self.email = email
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }
    
    func logOut() {
            try! Auth.auth().signOut()
            self.isLoggedIn = false
            self.session = nil
    }
    
    func signUp(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        self.email = email
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }
    
    init() {
        let db = Firestore.firestore()
        db.collection("msgs").order(by: "timestamp").addSnapshotListener { (snap, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            
            for i in snap!.documentChanges {
                if i.type == .added {
                    let msg = i.document.get("msg") as! String
                    let email = i.document.get("email") as! String
                    let id = i.document.documentID
                    self.msgs.append(Msg(id: id, msg: msg, email: email))
                }
            }
        }
    }
    
    func addMsg(msg: String, email: String) {
        let db = Firestore.firestore()
        db.collection("msgs").addDocument(data: ["msg": msg, "email": email, "timestamp": Timestamp()]) { (err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            print("success")
        }
    }

}
