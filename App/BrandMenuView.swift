
import PopupView
import SwiftUI


struct BrandMenuView: View {
    
    
    @EnvironmentObject var brandObservable: BrandOB
    @State var showingPopup = false
    @State var ind: Int = -1
    
    
    private let aa = ["starbucks", "twosome"]

    var body: some View {
        ZStack{
            
            VStack(spacing: 0, content: {
                
                BrandNavigationBarView()
                    .padding(.horizontal)
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                
                BrandTitleView()
                    .padding(6)
                
                
                ScrollView(.vertical, showsIndicators: false, content: {
                    
                    LazyVGrid(columns: gridLayout, spacing: 15, content: {
                    
                        ForEach(drinks.filter({ $0.brand == aa[brandObservable.indexBrand] })) { drink in
                            
                            BrandMenuGridView(drinks: drink)
                                .onTapGesture {
                                    
                                    ind = drink.id - 1

                                    if (ind != -1) {

                                        self.showingPopup.toggle()

                                    }

                                }
                            
                        }

                    }).padding(.horizontal, 15)
                    
                })
                
                
                
            })
            .ignoresSafeArea(.all, edges: .all)
            
        }
        .popup(isPresented: $showingPopup) {
            
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




extension Color{
    
}

struct BrandMenuView_Previews: PreviewProvider {
    static var previews: some View {
        BrandMenuView()
            .environmentObject(BrandOB())
            .padding()
            .background(Color.gray)
    }
}
