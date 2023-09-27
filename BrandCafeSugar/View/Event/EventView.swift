

import SwiftUI

struct EventView: View {
    
    private let timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()
    @State private var index = 0

    var body: some View {
        
        GeometryReader { proxy in
            
            TabView(selection: $index) {
                ForEach(events) { event in
                    
                    
                    EventItemView(event: event)
                        .padding(.top, 20)
                        .padding(.horizontal, 10)
                        .onTapGesture {
                            
                            // go link
                            print("123123")
                        }
                    
                    
                }
            } //: TAB
            .frame(height: 300)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .onReceive(timer, perform: { _ in
                withAnimation {
                    index = index < events.count ? index + 1 : 1
                }
            })
            
            
        }
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView()
            .previewLayout(.sizeThatFits)
            .background(Color.gray)
    }
}
