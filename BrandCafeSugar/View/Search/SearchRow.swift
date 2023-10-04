

import SwiftUI

struct SearchRow: View {
    
    let drinks: Drink
    
    var body: some View {
        HStack {
            Image(drinks.menuImage)
              .resizable()
              .scaledToFit()
              .padding(2)
              .frame(width: 60, height: 60)
              .cornerRadius(5)
            Text(drinks.menu)
        }
        
    }
}

struct SearchRow_Previews: PreviewProvider {
    static var previews: some View {
        SearchRow(drinks: drinks[0])
            
    }
}
