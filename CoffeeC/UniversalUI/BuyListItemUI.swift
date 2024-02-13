import SwiftUI

struct BuyListItemUI: View {
    var name: String
    var price: String
    var numberOfCups: Int
    var addCoffeeAction: () -> Void
    var removeCoffeeAction: () -> Void
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 90)
                .foregroundStyle(.coffeeList)
                .clipShape(.rect(cornerSize: .init(width: 5, height: 5)))
                .shadow(color: .shadow, radius: 2, x: 0.0, y: 3)
                .padding(.horizontal)
            
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text(name)
                        .foregroundStyle(.accent)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text(price)
                        .foregroundStyle(.brown)
                }
                
                Spacer()
                
                HStack {
                    ZStack {
                        Rectangle()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.coffeeList)
                        
                        Image(systemName: "minus")
                            .fontWeight(.bold)
                    }
                    .onTapGesture {
                        removeCoffeeAction()
                    }
                    
                    Text("\(numberOfCups)")
                        .fontWeight(.bold)
                    
                    Image(systemName: "plus")
                        .fontWeight(.bold)
                        .onTapGesture {
                            addCoffeeAction()
                        }
                    
                    Spacer()
                        .frame(width: 10)
                }
                .foregroundStyle(.accent)
                
            }
            .padding(.horizontal, 30)
        }
    }
}

//#Preview {
//    BuyListItemUI(name: "Горячий шоколад", price: "200 руб", numberOfCups: 1)
//}
