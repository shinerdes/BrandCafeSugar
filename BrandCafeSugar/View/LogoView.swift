
import SwiftUI

struct LogoView: View {
    var body: some View {
        
        HStack(spacing: 4) {
            Text("Brand".uppercased())
                .font(.title3)
                .fontWeight(.black)
                .foregroundColor(Color("reverseBackground"))
            Image("sugar")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30, alignment: .center)
            Text("Cafe".uppercased())
                .font(.title3)
                .fontWeight(.black)
                .foregroundColor(Color("reverseBackground"))
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
