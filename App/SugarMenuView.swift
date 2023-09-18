

import SwiftUI

struct SugarMenuView: View {
    
    
    @EnvironmentObject var sugarObservable: SugarOB
    @State var showingPopup = false
    @State var showingInfoPopup = false
    @State var ind: Int = -1
    
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 5, content: {
                
                SugarNavigationBarView()
                    .padding(.horizontal)
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                
                Divider()
                
                HStack {
                    TitleView(title: "Sugar Lv.\(sugarObservable.indexSugar + 1)")
                    Image(systemName: "info.circle")
                        .imageScale(.large)
                        .onTapGesture {
                            self.showingInfoPopup.toggle()
                        }
                    Spacer()
                }
                
                Divider()
                
                ScrollView(.vertical, showsIndicators: false, content: {
                    
                    LazyVGrid(columns: gridLayout, spacing: 10, content: {
                        
                        
                        switch sugarObservable.indexSugar {
                        case 0:
                            ForEach(drinks.filter({ $0.sugar >= 0 && $0.sugar <= 10 })) { drink in
                                SugarMenuGridView(drinks: drink)
                                    .onTapGesture {

                                        ind = drink.id - 1
                                        if (ind != -1) {
                                            self.showingPopup.toggle()
                                        }
                                    }
                            }
                            
                        case 1:
                            ForEach(drinks.filter({ $0.sugar >= 11 && $0.sugar <= 20 })) { drink in
                                SugarMenuGridView(drinks: drink)
                                    .onTapGesture {

                                        ind = drink.id - 1
                                        if (ind != -1) {
                                            self.showingPopup.toggle()
                                        }
                                    }
                            }
                            
                        case 2:
                            ForEach(drinks.filter({ $0.sugar >= 21 && $0.sugar <= 30 })) { drink in
                                SugarMenuGridView(drinks: drink)
                                    .onTapGesture {

                                        ind = drink.id - 1
                                        if (ind != -1) {
                                            self.showingPopup.toggle()
                                        }
                                    }
                            }
                            
                        case 3:
                            ForEach(drinks.filter({ $0.sugar >= 31})) { drink in
                                SugarMenuGridView(drinks: drink)
                                    .onTapGesture {

                                        ind = drink.id - 1
                                        if (ind != -1) {
                                            self.showingPopup.toggle()
                                        }
                                    }
                            }
                            
                        default:
                            Text("그럴일은 없다")
                        }
                        
                        
                        
                    })
                    .padding(6)
                    
                })
                
                
                
                
                
                
            }).ignoresSafeArea(.all, edges: .all)

            
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
        .popup(isPresented: $showingInfoPopup) {
            
            SugarInfoView(showingInfoPopup: $showingInfoPopup)
            
        } customize: {
            $0
                .type(.default)
                .position(.center)
                .animation(.spring())
                .closeOnTapOutside(true)
                .backgroundColor(.black.opacity(0.5))
            
        }
       
        
    }
}

struct SugarMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SugarMenuView()
            .environmentObject(SugarOB())
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.white)
    }
}
