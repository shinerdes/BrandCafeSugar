
import SwiftUI

struct BrandView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            LazyHGrid(rows: gridLayout, spacing: columnSpacing, content: {
                ForEach(brands) { brand in
                  BrandItemView(brand: brand)
                        .onTapGesture {
                            
                        }
                }
            }) //: GRID
            .frame(height: 245)
            .padding(15)
        }) //: SCROLL
    }
}

struct BrandView_Previews: PreviewProvider {
    static var previews: some View {
        BrandView()
            .background(Color.gray)
    }
}


