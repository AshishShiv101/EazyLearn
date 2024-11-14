import SwiftUI

struct BookmarkView: View {
    let bookmarks = [
        (title: "Swift Basics", notes: 12, imageName: "swift"),
        (title: "UI Design", notes: 8, imageName: "paintpalette"),
        (title: "Advanced SwiftUI", notes: 15, imageName: "app"),
        (title: "Networking", notes: 10, imageName: "network"),
        (title: "Data Persistence", notes: 5, imageName: "folder")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(bookmarks, id: \.title) { bookmark in
                        HStack {
                            // Image on the left side of the card
                            Image(systemName: bookmark.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .background(Color.yellow.opacity(0.2))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.yellow, lineWidth: 1))
                            
                            // Bookmark details
                            VStack(alignment: .leading, spacing: 6) {
                                Text(bookmark.title)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                
                                Text("\(bookmark.notes) Notes")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .padding(.leading, 10)
                            
                            Spacer()
                            
                            // Right arrow icon
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.white)
                                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                        )
                        .padding(.horizontal)
                    }
                }
                .padding(.top, 16)
            }
            .background(Color.yellow.opacity(0.05))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Bookmark")
                        .font(.headline)
                        .foregroundColor(.yellow)
                }
            }
        }
    }
}

#Preview {
    BookmarkView()
}
