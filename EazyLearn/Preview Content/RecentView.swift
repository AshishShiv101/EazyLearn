import SwiftUI

struct RecentView: View {
    // Dummy data for recent notes (replace with your model or actual data)
    @State private var recentNotes: [Note] = [
        Note(title: "Meeting Notes", content: "Discussed project milestones...", date: Date()),
        Note(title: "Shopping List", content: "Milk, Eggs, Bread, Coffee...", date: Date().addingTimeInterval(-86400)),
        Note(title: "Workout Plan", content: "Cardio, Strength, Yoga...", date: Date().addingTimeInterval(-172800))
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Section heading
            Text("Recent")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .padding(.horizontal)
                .padding(.top)

            // Horizontal carousel of recent notes
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(recentNotes) { note in
                        NoteCard(note: note)
                            .frame(width: 250) // Set card width for carousel effect
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.bottom)
    }
}

// MARK: - Note Card View
struct NoteCard: View {
    let note: Note

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(note.title)
                .font(.headline)
                .foregroundColor(.primary)

            Text(note.content)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(2)

            Text(note.date, style: .date)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

// MARK: - Note Model
struct Note: Identifiable {
    let id = UUID()
    let title: String
    let content: String
    let date: Date
}

#Preview {
    RecentView()
}
