//
//  ContentView.swift
//  SPM-Modules
//
//  Created by Fernando Maximiliano on 26/04/23.
//

import SwiftUI

public struct ContentView: View {
    @StateObject var authenticationViewModel = AuthenticationViewModel()
    @State var email: String = ""
    @State var password: String = ""
    
    public init() {}
    
   public var body: some View {
        VStack {
            Image("AppleLogo", bundle: .module)
                .resizable()
                .frame(width: 200, height: 200)
            Group{
                HStack {
                    Image(systemName: "envelope.fill")
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                }
                HStack {
                    Image(systemName: "key.fill")
                    TextField("Password", text: $password)
                        .keyboardType(.emailAddress)
                }
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.black, lineWidth: 1)
            )
            .padding(.horizontal, 80)
            
        
        .padding()
        Button("Login"){
            print("Login")
            authenticationViewModel.login(email: email, password: password)
        }
        .buttonStyle(.bordered)
        .tint(.black)
        Text("Registrate")
                .font(.footnote)
                .underline()
                .foregroundStyle(.tertiary)
                .padding(.top, 40)
            Spacer()
        }
        
        .alert(authenticationViewModel.loginStatus == .success ? "Login success" : "Login error", isPresented: $authenticationViewModel.didUpdtateLoginStatus) {
            Button("Aceptar") {
                print("Dismiss Alert")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
