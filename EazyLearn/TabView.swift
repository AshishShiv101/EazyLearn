import SwiftUI

struct CustomTabView: View {
       var body: some View {
        
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("House")
                }
            GuideView()
                .tabItem {
                    Image(systemName: "bookmark")
                    Text("bookmark")
                }
            ShareView()
                .tabItem {
                    Image(systemName: "text.bubble")
                    Text("Community")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
        }
        .accentColor(Color("BrandPrimary"))

    }
}

#Preview {
    CustomTabView()
}
