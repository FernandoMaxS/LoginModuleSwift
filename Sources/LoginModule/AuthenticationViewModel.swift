//
//  AuthenticationViewModel.swift
//  SPM-Modules
//
//  Created by Fernando Maximiliano on 26/04/23.
//

import Foundation


public enum LoginStatus {
    case success
    case error
}

 final public class AuthenticationViewModel: ObservableObject {
    
    @Published public var loginStatus: LoginStatus = .success
    @Published public var didUpdtateLoginStatus: Bool = false
    
     public init() {}
     
    public func login(email: String, password: String) {
        if email.lowercased() == "fernando@gmail.com" {
            loginStatus = .success
        }else{
            loginStatus = .error
        }
        
        didUpdtateLoginStatus = true
    }
    
    func signup(email: String, password: String) {
        print("Registrate")
    }
    
    func recoverPassword(email: String){
        print("Recuperar password")
    }
    
}
