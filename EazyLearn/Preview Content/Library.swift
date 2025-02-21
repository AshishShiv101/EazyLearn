import SwiftUI

struct CustomNote: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let creationDate: Date
    let tag: String
    let tagColor: Color
}

struct Notes: View {
    @State private var searchText = ""
    @State private var selectedTag: String? = nil
    
    let tags: [(name: String, color: Color)] = [
        ("Exam", .red),
        ("Notes", .blue),
        ("Routine", .green),
        ("Finance", .orange)
    ]
    
    @State private var notes = [
        CustomNote(title: "SwiftUI Basics", description: "Learn about views, modifiers, and layouts.", creationDate: Date(), tag: "Notes", tagColor: .blue),
        CustomNote(title: "Networking in iOS", description: "Understand URLSession and async/await.", creationDate: Date().addingTimeInterval(-86400), tag: "Exam", tagColor: .red),
        CustomNote(title: "Combine Framework", description: "Explore reactive programming in iOS.", creationDate: Date().addingTimeInterval(-172800), tag: "Routine", tagColor: .green),
        CustomNote(title: "Core Data", description: "Master data persistence using Core Data.", creationDate: Date().addingTimeInterval(-259200), tag: "Finance", tagColor: .orange)
    ]
    
    var filteredNotes: [CustomNote] {
        let searchFiltered = searchText.isEmpty ? notes : notes.filter {
            $0.title.localizedCaseInsensitiveContains(searchText) ||
            $0.description.localizedCaseInsensitiveContains(searchText)
        }
        
        if let selectedTag = selectedTag {
            return searchFiltered.filter { $0.tag == selectedTag }
        } else {
            return searchFiltered
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.yellow)
                    TextField("Search notes", text: $searchText)
                        .padding(8)
                        .background(Color.yellow.opacity(0.1))
                        .cornerRadius(8)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                
                // Tag Filter Buttons (Centered)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(tags, id: \.name) { tag in
                            Button(action: {
                                selectedTag = selectedTag == tag.name ? nil : tag.name
                            }) {
                                Text(tag.name)
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 16)
                                    .background(tag.color.opacity(selectedTag == tag.name ? 1.0 : 0.6))
                                    .cornerRadius(20)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .center) // Center alignment
                    .padding(.horizontal)
                }
                
                // Notes List
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 16)], spacing: 16) {
                        ForEach(filteredNotes) { note in
                            NavigationLink(destination: NotesDetailView(note: note)) {
                                NoteCardView(note: note)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                }
            }
            .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
            .navigationBarTitle("My Notes", displayMode: .inline)
        }
    }
}

struct NoteCardView: View {
    let note: CustomNote
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: note.creationDate)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(note.title)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Text(note.tag)
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(6)
                    .background(note.tagColor)
                    .cornerRadius(8)
            }
            
            Text(note.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(3)
                .multilineTextAlignment(.leading)
            
            HStack {
                Text(formattedDate)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.top, 8)
                Spacer()
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
    }
}



#Preview {
    Notes()
}
