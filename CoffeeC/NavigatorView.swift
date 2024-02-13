import SwiftUI

struct NavigatorView: View {
    init() {
        UINavigationBar.customize()
    }
    
    @AppStorage("token") var token = ""
    
    var body: some View {
        NavigationStack {
            if token.isEmpty {
                AuthorizationView()
                    .navigationTitle("Вход")
                    .toolbarTitleDisplayMode(.inline)
            } else {
                CoffeeListView()
            }
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    NavigatorView()
}
