import SwiftUI

struct AuthorizationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isButtonPressed = false
    
    @State private var showsAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
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
        .alert(isPresented: $showsAlert) {
            Alert(
                title: Text(alertTitle),
                message: Text(alertMessage),
                dismissButton: .default(Text("OK") )
            )
        }
    }
    
    private func entryAccount() {
        let loginData = LoginData(login: email, password: password)
        
        APIManager.shared.login(loginData: loginData) { result in
            switch result {
            case .success(let authResponse):
                print("Login successful, token: \(authResponse.token)")
                withAnimation {
                    NavigatorView().token = authResponse.token
                }
                
                isButtonPressed = true
            case .failure(let error):
                print("Login failed with error: \(error)")
                
                alertTitle = "Ошибка входа"
                alertMessage = "Пожалуйста проверьте правильность введённых данных"
                showsAlert = true
            }
        }
    }
}

#Preview {
    NavigationStack {
        AuthorizationView()
    }
}
