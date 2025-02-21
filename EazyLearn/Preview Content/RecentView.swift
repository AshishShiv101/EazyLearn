import SwiftUI

struct RecentView: View {
    @State private var recentNotes: [Note] = [
        Note(title: "Meeting Notes", content: "Discussed project milestones...", date: Date(), tag: "Notes"),
        Note(title: "Shopping List", content: "Milk, Eggs, Bread, Coffee...", date: Date().addingTimeInterval(-86400), tag: "Finance"),
        Note(title: "Workout Plan", content: "Cardio, Strength, Yoga...", date: Date().addingTimeInterval(-172800), tag: "Routine")
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
                            .frame(width: 250, height: 140) // Adjust height to ensure visibility
                    }
                }
                .padding(.horizontal)
                .padding(.bottom) // Extra padding to prevent clipping
            }
        }
        .padding(.bottom)
    }
}

// MARK: - Note Card View
struct NoteCard: View {
    let note: Note

    // Define tag colors
    let tagColors: [String: Color] = [
        "Exam": .red,
        "Notes": .blue,
        "Routine": .green,
        "Finance": .orange
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Tag marker at the top-right corner
            HStack {
                Spacer()
                if let tagColor = tagColors[note.tag] {
                    Text(note.tag)
                        .font(.caption)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(tagColor)
                        .cornerRadius(10)
                        .padding(.top, -5)
                        .padding(.trailing, -5)
                }
            }

            Text(note.title)
                .font(.headline)
                .foregroundColor(.primary)

            Text(note.content)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(2)

            Spacer() // Push content to the top

            Text(note.date, style: .date)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .frame(height: 140) // Set a fixed height to prevent clipping
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
    let tag: String // New field to store the note's category
}

#Preview {
    RecentView()
}
