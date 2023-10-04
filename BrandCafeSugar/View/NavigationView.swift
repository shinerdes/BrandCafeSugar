

import SwiftUI

struct NavigationView: View {

    var body: some View {

            HStack {
          
                Button(action: {
                    
                }, label: {
                    Image(systemName: "magnifyingglass")
                        .font(.title)
                        .foregroundColor(Color("reverseBackground"))
                }) //: BUTTON
                
                Spacer()
                
                LogoView()
                
                Spacer()
                
                Button(action: {}, label: {
                    Image(systemName: "magnifyingglass")
                        .font(.title)
                        .foregroundColor(Color("reverseBackground"))
                }) //: BUTTON
                
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


//                Button(action: {
//                    NavigationLink(destination: SearchView()) {
//
//                    }
//                    // SearchView
//                    // 검색 쪽
//                }, label: {
//                    Image(systemName: "magnifyingglass")
//                        .font(.title)
//
//                }) //: BUTTON
