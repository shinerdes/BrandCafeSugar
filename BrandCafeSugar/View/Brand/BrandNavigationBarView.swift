

import SwiftUI

struct BrandNavigationBarView: View {
    
    @EnvironmentObject var brandObservable: BrandOB
    
    
    var body: some View {
        HStack {
            Button(action: {
                withAnimation(.none) {
                    feedback.impactOccurred()
                    brandObservable.selectedBrand = nil
                    brandObservable.openBrandPage = false
                    brandObservable.indexBrand = 0
              
                }
            }, label: {
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundColor(Color("reverseBackground"))
            })
            
            Spacer()
            
         
        }
    }
}

struct BrandDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BrandNavigationBarView()
            .environmentObject(BrandOB())
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray)
    }
}
