import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            Notes()
                .tabItem {
                    Label("Library", systemImage: "books.vertical.fill")
                }
        }
        .accentColor(.yellow)  // Set selected tab color to yellow
    }
}

#Preview {
    MainTabView()
}
