
import PopupView
import SwiftUI


struct BrandMenuView: View {
    
    
    @EnvironmentObject var brandObservable: BrandOB
    @State var showingPopup = false
    @State var ind: Int = -1
    @State var menuIndex: Int = 0
    
    private let menus = ["Default", "Ascending", "descending"]
    private let menusIcon = ["arrow.right.circle", "arrow.up.circle", "arrow.down.circle"]
    private let aa = ["starbucks", "twosome"]

    var body: some View {
        ZStack{
            
            VStack(spacing: 0, content: {
                
                BrandNavigationBarView()
                    .padding(.horizontal)
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                
                Divider()
                
                BrandTitleView()
                    .padding(6)
                
                Divider()
                
                HStack {
                    
                    Spacer()
                    
                    
                    Menu{
                        
                        Section {
                            Button(action: {
                                menuIndex = 0
                                
                            }) {
                                Label("Default", systemImage: "arrow.right.circle")
                            }
                            Button(action: {
                                menuIndex = 1
                            }) {
                                Label("Ascending", systemImage: "arrow.up.circle")
                            }
                            Button(action: {
                                menuIndex = 2
                            }) {
                                Label("descending", systemImage: "arrow.down.circle")
                            }
                            
                            
                            
                        }
                        
                       
                       
        
                    } label: {
                        Label(menus[menuIndex], systemImage: menusIcon[menuIndex])
                    }
                    .padding(.trailing, 10)
                    
                
                   
                }
                .frame(height: 50)
                
                
                Divider()
                
                
                ScrollView(.vertical, showsIndicators: false, content: {
                    
                    LazyVGrid(columns: gridLayout, spacing: 15, content: {
                    
                      
                        
                        if (menuIndex == 0) {
                            
                            ForEach(drinks.filter({ $0.brand == aa[brandObservable.indexBrand] })) { drink in
                                
                                BrandMenuGridView(drinks: drink)
                                    .onTapGesture {
                                        
                                        ind = drink.id - 1
                                        
                                        if (ind != -1) {
                                            
                                            self.showingPopup.toggle()
                                            
                                        }
                                        
                                    }
                                
                            }
                         }
                         
                         else if (menuIndex == 1) {
                         
                         
                             
                             ForEach(drinks.filter({ $0.brand == aa[brandObservable.indexBrand] }).sorted(by: {$0.sugar <= $1.sugar})) { drink in
                                 
                                 SugarMenuGridView(drinks: drink)
                                     .onTapGesture {
                                         ind = drink.id - 1
                                         if (ind != -1) {
                                             self.showingPopup.toggle()
                                         }
                                     }
                             }
                         }
                         
                         else if (menuIndex == 2) {
                             
                             ForEach(drinks.filter({ $0.brand == aa[brandObservable.indexBrand] }).sorted(by: {$0.sugar >= $1.sugar})) { drink in
                                 
                                 SugarMenuGridView(drinks: drink)
                                     .onTapGesture {
                                         ind = drink.id - 1
                                         if (ind != -1) {
                                             self.showingPopup.toggle()
                                         }
                                     }
                             }
                         }
                         

                    }).padding(.horizontal, 15)
                    
                })
                
                
                
            })
            .ignoresSafeArea(.all, edges: .top)
            
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
