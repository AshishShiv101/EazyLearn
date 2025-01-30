import SwiftUI

struct NotesDetailView: View {
    let note: CustomNote
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text(note.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(.top, 20)
                
                Text(note.description)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 20)
                
                Spacer()
                
                Text("Created on \(formattedDate(from: note.creationDate))")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.bottom, 20)
            }
            .padding()
            .navigationTitle("Note Detail")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    // Helper function to format the date
    private func formattedDate(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

