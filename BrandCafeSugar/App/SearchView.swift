
import SwiftUI
import PopupView

struct SearchView: View {
    
    @EnvironmentObject var searchObservable: SearchOB
    @State var showingPopup = false
    @State var ind: Int = -1
    @State private var searchText = ""
    
    var body: some View {
        
        ZStack {
            VStack {
                SearchNavigationBarView()
                    .padding(.horizontal)
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                
                SearchBar(text: $searchText)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                
                
                List {
                    ForEach(drinks.filter{$0.menu.contains(searchText) || searchText == ""}) { item in
                        
                        SearchRow(drinks: item)
                            .onTapGesture {
                                ind = item.id - 1
                                if (ind != -1) {
                                    self.showingPopup.toggle()
                                }
                            }
                    }
                    
                }.listStyle(PlainListStyle())
                
                    .onTapGesture {
                        hideKeyboard()
                    }
            }.ignoresSafeArea(.all, edges: .top)
            
        }.popup(isPresented: $showingPopup) {
            
            PopupView(ind: $ind, showingPopup: $showingPopup)
            
        } customize: {
            $0
                .type(.default)
                .position(.center)
                .animation(.easeIn)
                .closeOnTapOutside(true)
                .backgroundColor(.black.opacity(0.5))
            
        }
      }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(SearchOB())
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.white)
        
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
