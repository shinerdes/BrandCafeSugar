

import SwiftUI

struct PopupView: View {
    @Binding var ind : Int
    @Binding var showingPopup: Bool
    
    //let ind: Int
    
    var body: some View{
        
        VStack(spacing: 10){
            
            VStack(spacing: 5){
                ZStack(alignment: .topLeading){
                    Image(drinks[ind].menuImage)
                        .resizable()
                        .scaledToFit()
                        .padding(3)
                        .frame(width: 175, height: 175)
                        .cornerRadius(20)
                    
                    Image("\(drinks[ind].brand)-logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .padding(3)
                        .offset(x: 10, y: 10)
                    
                }
                Text("\(drinks[ind].menu)")
                Text("Sugars : \(drinks[ind].sugar)")
                Text("Kcal : \(drinks[ind].kcal)")
                
            }
            .padding(.horizontal, 5)
            .frame(width: 250, height: 300)
            .background(Color("background"))
            .cornerRadius(20)

            Spacer().frame(height: 5)
            
            Button(action: {
                self.showingPopup.toggle()
            }){
                Text("닫기")
                    .font(.system(size: 15))
                    .foregroundColor(Color("reverseBackground"))
                    .fontWeight(.bold)
            }
            .frame(width: 100, height: 50)
            .background(Color("background"))
            .cornerRadius(20)
        }
        .padding(.horizontal, 10)
        .frame(width: 300, height: 400)
        .background(Color("reverseBackground"))
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

struct PopupView_Previews: PreviewProvider {
    static var previews: some View {
        PopupView(ind: .constant(25), showingPopup: .constant(true))
    }
}
