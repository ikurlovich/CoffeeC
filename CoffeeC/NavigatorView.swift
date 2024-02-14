import SwiftUI

struct NavigatorView: View {
    init() {
        UINavigationBar.customize()
    }
    
    @AppStorage("token") var token = ""
    
    var body: some View {
        NavigationStack {
            AuthorizationView()
                .navigationTitle("Вход")
                .toolbarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    NavigatorView()
}
