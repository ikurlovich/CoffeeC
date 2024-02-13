//
//  CoffeeMapView.swift
//  CoffeeC
//
//  Created by Илья Курлович on 11.02.2024.
//

import SwiftUI
import MapKit

struct CoffeeMapView: View {
    @StateObject var vm = CoffeeVM()
    
    @State private var cameraPosition: MapCameraPosition = .region(.userRegion)
    @State private var isButtonPressed = false
    
    var body: some View {
        VStack {
            Map(position: $cameraPosition) {
                UserAnnotation()
                
                ForEach(vm.coffeeShopsMock) { coffee in
                    Annotation("", coordinate: .init(latitude: coffee.point.latitude, longitude: coffee.point.longitude)) {
                        
                        VStack {
                            Image("coffeeMarker")
                            
                            Text(coffee.name)
                                .fontWeight(.bold)
                                .foregroundStyle(.mapText)
                        }
                        .onTapGesture {
                            tapToMarker()
                        }
                    }
                }
            }
        }
        .arrowToolBarUI(name: "Карта")
        .navigationDestination(isPresented: $isButtonPressed) {
            CoffeeMenuView()
        }
    }
    
    private func tapToMarker() {
        isButtonPressed = true
    }
}

extension CLLocationCoordinate2D {
    static var userLocation: CLLocationCoordinate2D {
        .init(latitude: 44.695, longitude: 37.768)
    }
}

extension MKCoordinateRegion {
    static var userRegion: MKCoordinateRegion {
        .init(center: .userLocation,
              latitudinalMeters: 3000,
              longitudinalMeters: 3000)
    }
}

#Preview {
    NavigationStack {
        CoffeeMapView()
    }
}
