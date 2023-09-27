

import SwiftUI

struct BrandTitleView: View {
    
    
    @EnvironmentObject var brandObservable: BrandOB
    
    
    
    var body: some View {
        HStack {
            
            Spacer()
            
            Image(brandObservable.selectedBrand?.image ?? sampleBrand.image)
                .resizable()
                .scaledToFit()
                .padding(3)
                .frame(width: 75, height: 75)
                .background(Color.white.cornerRadius(12))
                .background(
                    RoundedRectangle(cornerRadius: 12).stroke(Color.gray, lineWidth: 1)
            )
            TitleView(title: brandObservable.selectedBrand?.name ?? sampleBrand.name)
            
            Spacer()

        }
        .padding(15)
    }
}

struct BrandTitleView_Previews: PreviewProvider {
    static var previews: some View {
        BrandTitleView()
            .environmentObject(BrandOB())
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray)
    }
}
