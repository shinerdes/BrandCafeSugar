

import SwiftUI

struct NavigationView: View {
    var body: some View {
        HStack {
      
            
            Spacer()
            
            LogoView()
         
            Spacer()
            
           
        }
        
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
