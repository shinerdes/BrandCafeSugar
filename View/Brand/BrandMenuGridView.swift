

import SwiftUI

struct BrandMenuGridView: View {
    
    let drinks: Drink
   
    
    var body: some View {
        VStack(spacing: 6, content: {
            
            ZStack(alignment: .topLeading){

                Image(drinks.menuImage)
                    .resizable()
                    .scaledToFit()
                    .padding(3)
                    .frame(width: 180, height: 180)
                    .cornerRadius(24)

                Image("\(drinks.brand)-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .padding(3)
                    .offset(x: 10, y: 10)

            }
            
            Text("\(drinks.menu)")
                .frame(width: 150, height: 50)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding(.horizontal, 5)
          
        })
        .frame(width: UIScreen.main.bounds.width, height: 225)
    }
}

struct BrandMenuGridView_Previews: PreviewProvider {
    static var previews: some View {
        BrandMenuGridView(drinks: drinks[3])
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray)
    }
}
