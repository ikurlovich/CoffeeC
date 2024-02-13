//
//  NavigatorView.swift
//  CoffeeC
//
//  Created by Илья Курлович on 09.02.2024.
//

import SwiftUI

struct NavigatorView: View {
    init() {
        UINavigationBar.customize()
    }
    
    var body: some View {
        NavigationStack {
            AuthorizationView()
                .navigationTitle("Вход")
                .toolbarTitleDisplayMode(.inline)
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    NavigatorView()
}
