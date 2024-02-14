import SwiftUI
import MapKit

struct CoffeeMapView: View {
    @StateObject var vm = CoffeeVM()
    
    @State private var cameraPosition: MapCameraPosition = .region(.userRegion)
    @State private var isButtonPressed = false
    @State private var idCoffee = 0
    
    var body: some View {
        VStack {
            Map(position: $cameraPosition) {
                UserAnnotation()
                
                ForEach(vm.coffeeShopsMock) { coffee in
                    Annotation("", coordinate: .init(latitude: Double(coffee.point.latitude) ?? 44.695, longitude: Double(coffee.point.longitude) ?? 37.768)) {
                        
                        VStack {
                            Image("coffeeMarker")
                            
                            Text(coffee.name)
                                .fontWeight(.bold)
                                .foregroundStyle(.mapText)
                        }
                        .onTapGesture {
                            tapToMarker()
                            idCoffee = coffee.id
                        }
                    }
                }
            }
        }
        .task {
            vm.getLocations()
        }
        .arrowToolBarUI(name: "Карта")
        .navigationDestination(isPresented: $isButtonPressed) {
            CoffeeMenuView(idCoffee)
        }

    }
    
    private func tapToMarker() {
        isButtonPressed = true
    }
}

extension CLLocationCoordinate2D {
    static var userLocation: CLLocationCoordinate2D {
        .init(latitude: 44.622914, longitude: 44.660122)
    }
}

extension MKCoordinateRegion {
    static var userRegion: MKCoordinateRegion {
        .init(center: .userLocation,
              latitudinalMeters: 60000,
              longitudinalMeters: 60000)
    }
}

#Preview {
    NavigationStack {
        CoffeeMapView()
    }
}
