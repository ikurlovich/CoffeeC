//
//  AuthorizationView.swift
//  CoffeeC
//
//  Created by Илья Курлович on 10.02.2024.
//

import SwiftUI

struct AuthorizationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isButtonPressed = false
    
    var body: some View {
        VStack(spacing: 20) {
            EmailUI(email: $email)
            
            PasswordUI(password: $password, name: "Пароль")
            
            UniversalButtonUI("Войти") {
                entryAccount()
            }
            
            NavigationLink {
                RegistrationView()
            } label: {
                Text("Зарегистрироваться")
                    .foregroundStyle(.accent)
            }
        }
        .padding(.horizontal, 20)
        .navigationDestination(isPresented: $isButtonPressed) {
            CoffeeListView()
        }
    }
    
    private func entryAccount() {
        let loginData = LoginData(login: email, password: password)
        
        APIManager.shared.login(loginData: loginData) { result in
            switch result {
            case .success(let authResponse):
                print("Login successful, token: \(authResponse.token)")
//                isButtonPressed = true
                withAnimation {
                    NavigatorView().token = authResponse.token
                }
                
            case .failure(let error):
                print("Login failed with error: \(error)")
            }
        }
        
//        isButtonPressed = true
    }
}

#Preview {
    NavigationStack {
        AuthorizationView()
    }
}
