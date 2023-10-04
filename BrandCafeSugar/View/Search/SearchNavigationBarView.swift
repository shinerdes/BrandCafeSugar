

import SwiftUI

struct SearchNavigationBarView: View {
    
    @EnvironmentObject var searchObservable: SearchOB
    
    var body: some View {
        HStack {
            Button(action: {
                withAnimation(.none) {
                    feedback.impactOccurred()
                    searchObservable.openSearchPage = false

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

struct SearchNavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchNavigationBarView()
            .environmentObject(SearchOB())
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray)
    }
}
