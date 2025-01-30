import SwiftUI

struct CustomNote: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let creationDate: Date
}

struct Notes: View {
    @State private var searchText = ""
    @State private var notes = [
        CustomNote(title: "SwiftUI Basics", description: "Learn about views, modifiers, and layouts.", creationDate: Date()),
        CustomNote(title: "Networking in iOS", description: "Understand URLSession and async/await.", creationDate: Date().addingTimeInterval(-86400)),
        CustomNote(title: "Combine Framework", description: "Explore reactive programming in iOS.", creationDate: Date().addingTimeInterval(-172800)),
        CustomNote(title: "Core Data", description: "Master data persistence using Core Data.", creationDate: Date().addingTimeInterval(-259200)),
        CustomNote(title: "Swift Concurrency", description: "Dive into structured concurrency in Swift.", creationDate: Date().addingTimeInterval(-345600)),
        CustomNote(title: "ARKit Guide", description: "Build augmented reality apps with ARKit.", creationDate: Date().addingTimeInterval(-432000)),
        CustomNote(title: "UIKit vs. SwiftUI", description: "Compare traditional and declarative UI frameworks.", creationDate: Date().addingTimeInterval(-518400)),
        CustomNote(title: "iOS Animations", description: "Create engaging animations for your app.", creationDate: Date().addingTimeInterval(-604800))
    ]
    
    @State private var isCalendarPresented = false
    @State private var selectedDate = Date()
    
    var filteredNotes: [CustomNote] {
        if searchText.isEmpty {
            return notes.sorted { $0.creationDate > $1.creationDate }
        } else {
            return notes.filter {
                $0.title.localizedCaseInsensitiveContains(searchText) ||
                $0.description.localizedCaseInsensitiveContains(searchText)
            }
            .sorted { $0.creationDate > $1.creationDate }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Search Bar and Calendar Icon
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.yellow)
                    TextField("Search notes", text: $searchText)
                        .padding(8)
                        .background(Color.yellow.opacity(0.1))
                        .cornerRadius(8)
                    
                    Button(action: {
                        isCalendarPresented.toggle()
                    }) {
                        Image(systemName: "calendar")
                            .foregroundColor(.yellow)
                            .padding(8)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                
                // Card List
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
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("My Notes")
                        .font(.headline)
                        .foregroundColor(.yellow)
                }
            }
            .sheet(isPresented: $isCalendarPresented) {
                DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                    .datePickerStyle(WheelDatePickerStyle())
                    .padding()
                    .onChange(of: selectedDate) { newDate in
                        notes.sort { $0.creationDate > $1.creationDate }
                    }
            }
        }
    }
}

// A custom card view for individual notes with added subtle styling
struct NoteCardView: View {
    let note: CustomNote
    
    var formattedDate: String {
        // Format the creation date for display at the bottom-left corner
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: note.creationDate)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Title with a clean, simple font
            Text(note.title)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            // Description with a lighter font weight
            Text(note.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(3)
                .multilineTextAlignment(.leading)
            
            // Date and time at the bottom-left corner
            HStack {
                Text(formattedDate)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.top, 8)
                Spacer()
            }
        }
        .padding()
        .frame(maxWidth: .infinity) // Ensure equal card sizes
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
    }
}
#Preview {
    Notes()
}
