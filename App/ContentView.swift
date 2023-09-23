
import SwiftUI

struct ContentView: View {
    
    
    @EnvironmentObject var brandObservable: BrandOB
    @EnvironmentObject var sugarObservable: SugarOB
    
    // 당류를 바로 볼 수 있게?
    // ㅇ
    
    var body: some View {
        
        
        if brandObservable.openBrandPage == false && brandObservable.selectedBrand == nil && sugarObservable.openSugarPage == false && sugarObservable.selectedSugar == nil {
            
                VStack(spacing: 0) {
                    NavigationView()
                        .padding(.horizontal, 15)
                        .padding(.bottom)
                        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                        .background(Color("background"))
                        .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
     
                    ScrollView(.vertical, showsIndicators: false, content: {
                        
               
                        TitleView(title: "Event")
                        
                        EventView()
                            .frame(height: UIScreen.main.bounds.width / 1.5)
                            .padding(.top, -60)
                            .padding(.bottom, 10)
                            .padding(.vertical, 20)
                            .background(Color("background"))
                        
                        Divider()
                        
                        TitleView(title: "Brand")

                        ScrollView(.horizontal, showsIndicators: false, content: {
                            LazyHGrid(rows: gridLayout, spacing: columnSpacing, content: {
                                ForEach(brands) { brand in
                                    BrandItemView(brand: brand)
                                        .onTapGesture {
                                            feedback.impactOccurred()
                                            
                                            withAnimation(.easeOut) {
                                                brandObservable.openBrandPage = true
                                                brandObservable.selectedBrand = brand
                                                brandObservable.indexBrand = brand.id - 1
                                            }
                                        }
                                }
                            }) //: GRID
                            .frame(height: 245)
                            .padding(15)
                        }) //: SCROLL

                        Divider()
                        
                        TitleView(title: "Sugar")
                        
                        LazyVGrid(columns: gridLayout2, alignment: .leading, spacing: 5, content: {
                            
                            
                            ForEach(sugars) { sugar in
                                
                                
                                LowSugarMenuView(sugar: sugar)
                                    .onTapGesture {
                                        feedback.impactOccurred()

                                        withAnimation(.easeOut) {
                                            sugarObservable.openSugarPage = true
                                            sugarObservable.selectedSugar = sugar
                                            sugarObservable.indexSugar = sugar.id - 1
                                        }
                                        
                                    }
                                
                            }
                            
                        }).padding(.trailing, 5)
                        
                        
                        
                        
                    })
                }
                .ignoresSafeArea(.all, edges: .top)//: VSTACK
            
        }
        if
            brandObservable.openBrandPage == false
                && brandObservable.selectedBrand == nil
                && sugarObservable.openSugarPage == true
                && sugarObservable.selectedSugar != nil
        {
            SugarMenuView()
        }

        if brandObservable.openBrandPage == true
                    && brandObservable.selectedBrand != nil
                    && sugarObservable.openSugarPage == false
                    && sugarObservable.selectedSugar == nil
        {
            BrandMenuView()
        }
      
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 14 Pro")
            .environmentObject(BrandOB())
            .environmentObject(SugarOB())
            .background(Color.white)
    }
}
