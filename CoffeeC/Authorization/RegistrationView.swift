import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var repeatPassword = ""
    
    @State private var showsAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
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
        .alert(isPresented: $showsAlert) {
            Alert(
                title: Text(alertTitle),
                message: Text(alertMessage),
                dismissButton: .default(Text("OK") )
            )
        }
    }
    
    private func regAccount() {
        if password == repeatPassword {
            let loginData = LoginData(login: email, password: password)
            APIManager.shared.register(loginData: loginData) { result in
                switch result {
                case .success(let authResponse):
                    print("Registration successful, token: \(authResponse.token)")
                    alertTitle = "Успешно!"
                    alertMessage = "Вы зарегистрированы:\n\(email)\n\(password)"
                    showsAlert = true
                case .failure(let error):
                    print("Registration failed with error: \(error)")
                    alertTitle = "Ошибка"
                    alertMessage = "Введены некорректные данные!"
                    showsAlert = true
                }
            }
        } else {
            alertTitle = "Ошибка"
            alertMessage = "Пароли не совпадают!"
            showsAlert = true
            print("Passwords do not match")
        }
    }
}

#Preview {
    NavigationView {
        RegistrationView()
    }
}
