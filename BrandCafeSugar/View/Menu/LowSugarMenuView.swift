
import SwiftUI

struct LowSugarMenuView: View {
    
    let sugar: Sugar
    
    var body: some View {
        HStack(alignment: .center, spacing: 0, content: {
            
            Image(systemName: "\(sugar.id).circle.fill")
                .resizable()
                .scaledToFit()
                .padding(10)
                .frame(width: 80, height: 80)
                .cornerRadius(24)
             
            Spacer().frame(width: 20)
            
            Text(sugar.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            
            Spacer()
        })
        .frame(width: UIScreen.main.bounds.width)
        .background(Color("background"))

    }
}

struct LowSugarMenuView_Previews: PreviewProvider {
    static var previews: some View {
        LowSugarMenuView(sugar: sugars[0])
            .previewLayout(.sizeThatFits)
            .background(Color.gray)
    }
}

