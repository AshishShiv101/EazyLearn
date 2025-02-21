import SwiftUI

struct TagView: View {
    let tags: [(name: String, icon: String, color: Color)] = [
        ("Exam", "book.closed.fill", .red),
        ("Notes", "note.text", .blue),
        ("Routine", "calendar", .green),
        ("Finance", "dollarsign.circle.fill", .orange)
    ]

    var body: some View {
        VStack(spacing: 15) {
            HStack(spacing: 15) {
                TagButton(title: tags[0].name, icon: tags[0].icon, color: tags[0].color)
                TagButton(title: tags[1].name, icon: tags[1].icon, color: tags[1].color)
            }
            HStack(spacing: 15) {
                TagButton(title: tags[2].name, icon: tags[2].icon, color: tags[2].color)
                TagButton(title: tags[3].name, icon: tags[3].icon, color: tags[3].color)
            }
        }
        .padding()
    }
}

// MARK: - Tag Button View
struct TagButton: View {
    let title: String
    let icon: String
    let color: Color
    @State private var isPressed = false

    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.system(size: 28))
                .foregroundColor(.white)

            Text(title)
                .font(.headline)
                .foregroundColor(.white)
        }
        .padding()
        .frame(width: 120, height: 120) // Adjusted for square design
        .background(color)
        .cornerRadius(20)
        .shadow(color: color.opacity(0.4), radius: 5, x: 0, y: 4)
        .scaleEffect(isPressed ? 0.9 : 1.0) // Tap animation
        .animation(.spring(), value: isPressed)
        .onTapGesture {
            isPressed.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                isPressed.toggle()
            }
        }
    }
}

#Preview {
    TagView()
}
