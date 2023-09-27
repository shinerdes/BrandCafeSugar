
import SwiftUI

struct SugarNavigationBarView: View {
    
    @EnvironmentObject var sugarObservable: SugarOB
    
    
    var body: some View {
        HStack {
            Button(action: {
                withAnimation(.none) {
                    feedback.impactOccurred()
                    sugarObservable.selectedSugar = nil
                    sugarObservable.openSugarPage = false
                    sugarObservable.indexSugar = 0

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

struct SugarNavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        SugarNavigationBarView()
            .environmentObject(SugarOB())
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray)
    }
}
