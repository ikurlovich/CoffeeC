import SwiftUI

struct RegistrationView: View {
    @State private var email = "".lowercased()
    @State private var password = ""
    @State private var repeatPassword = ""
    
    var body: some View {
        VStack(spacing: 20) {
            EmailUI(email: $email)
            PasswordUI(password: $password, name: "Пароль")
            PasswordUI(password: $repeatPassword, name: "Повторите пароль")
            
            UniversalButtonUI("Регистрация") {
                regAccount()
            }
        }
        .padding(.horizontal, 20)
        .arrowToolBarUI(name: "Регистрация")
    }
    
    private func regAccount() {
        if password == repeatPassword {
            let loginData = LoginData(login: email, password: password)
            APIManager.shared.register(loginData: loginData) { result in
                switch result {
                case .success(let authResponse):
                    print("Registration successful, token: \(authResponse.token)")
                case .failure(let error):
                    print("Registration failed with error: \(error)")
                }
            }
        } else {
            print("Passwords do not match")
        }
    }
}

#Preview {
    NavigationView {
        RegistrationView()
    }
}
