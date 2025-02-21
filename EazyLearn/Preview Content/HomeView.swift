import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Welcome to EazyLearn")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .padding(.top)

                    Text("Start creating your notes effortlessly.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    // NoteView wrapped in a fixed-height container
                    VStack {
                        NoteView()
                    }
                    .frame(height: 400) // Set a fixed height for the container
                    
                    // Heading for TagView
                    Text("Quick Access")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .padding(.top, 10)

                    // Add TagView here
                    TagView()
                        .padding(.vertical)

                    // RecentView
                    RecentView()
                }
                .padding(.vertical)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Notes")
                        .font(.headline)
                        .foregroundColor(.yellow)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
