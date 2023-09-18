
import SwiftUI

struct SugarInfoView: View {
    
    @Binding var showingInfoPopup: Bool
    
    var body: some View {
   

        VStack(alignment: .leading) {
            
            Text("Sugar Level ")
                .foregroundColor(Color("background"))
            
            Spacer().frame(height: 10)
            
            Text("Lv.1 : From 0g to 10g ")
                .foregroundColor(Color("background"))
            Text("Lv.2 : From 11g to 20g ")
                .foregroundColor(Color("background"))
            Text("Lv.3 : From 21g to 30g ")
                .foregroundColor(Color("background"))
            Text("Lv.4 : Over 31g ")
                .foregroundColor(Color("background"))
        }
        .frame(width: 250, height: 200)
        .background(Color("reverseBackground"))
        .cornerRadius(10)
        
    
    }
}

struct SugarInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SugarInfoView(showingInfoPopup: .constant(true))
    }
}
