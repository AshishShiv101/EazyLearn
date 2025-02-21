import SwiftUI
import PhotosUI

struct NoteView: View {
    @State private var noteText: String = ""
    @State private var selectedImage: UIImage? = nil
    @State private var pickerItem: PhotosPickerItem? = nil
    @State private var showPicker: Bool = false
    @State private var showPromptAlert: Bool = false
    @State private var promptText: String = ""
    @State private var isSubmitted: Bool = false
    @State private var opacity: Double = 1.0
    @State private var cardHeight: CGFloat = 300
    @State private var selectedTag: (name: String, color: Color) = ("Select Tag", .gray)

    let tags: [(name: String, icon: String, color: Color)] = [
        ("Exam", "book.closed.fill", .red),
        ("Notes", "note.text", .blue),
        ("Routine", "calendar", .green),
        ("Finance", "dollarsign.circle.fill", .orange)
    ]

    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                // Section for the TextEditor
                VStack(alignment: .leading) {
                    HStack {
                        Text("Your Notes")
                            .font(.headline)
                            .foregroundColor(.primary)

                        Spacer()

                        // Tag Selection Menu Button
                        Menu {
                            ForEach(tags, id: \ .name) { tag in
                                Button(action: {
                                    selectedTag = (tag.name, tag.color)
                                }) {
                                    Label(tag.name, systemImage: tag.icon)
                                        .foregroundColor(tag.color)
                                }
                            }
                        } label: {
                            HStack {
                                Image(systemName: "tag.fill")
                                    .foregroundColor(selectedTag.color)
                                Text(selectedTag.name)
                                    .font(.subheadline)
                                    .foregroundColor(selectedTag.color)
                            }
                            .padding(8)
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(10)
                        }
                    }

                    ZStack(alignment: .topTrailing) {
                        if !isSubmitted {
                            TextEditor(text: $noteText)
                                .padding()
                                .frame(height: isSubmitted ? 0 : 150)
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(15)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                                )
                                .opacity(opacity)
                                .animation(.easeInOut(duration: 0.5), value: isSubmitted)

                            // Clear Text Button
                            if !noteText.isEmpty {
                                Button(action: {
                                    noteText = ""
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding(8)
                                }
                            }
                        }
                    }
                }
                .padding()

                // Section for "Attach Image"
                VStack(alignment: .leading) {
                    HStack {
                        Text("Attach Image")
                            .font(.headline)
                            .foregroundColor(.primary)

                        // Circular Add Image Button
                        Button(action: {
                            showPicker.toggle()
                        }) {
                            Image(systemName: "photo.badge.arrow.down.fill")
                                .font(.system(size: 40))
                                .foregroundColor(.black)
                                .padding(.leading, 160)
                        }
                    }
                    .padding(.top, -10)

                    // Display the selected image
                    if let image = selectedImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .cornerRadius(15)
                            .shadow(radius: 5)

                        // Remove Image Button
                        Button(action: {
                            selectedImage = nil
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.red)
                                .padding(8)
                        }
                    }

                    // Save Button
                    Button(action: {
                        withAnimation {
                            isSubmitted = true
                            opacity = 0
                            cardHeight = 0
                        }

                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            withAnimation {
                                noteText = ""
                                selectedImage = nil
                                selectedTag = ("Tag", .gray) // Reset tag to default
                                cardHeight = 300
                                isSubmitted = false
                                opacity = 1
                            }
                        }

                        print("Save action triggered")
                    }) {
                        Text("Save")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.yellow)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    .padding(.top, 15)
                }
                .padding()
            }
            .background(Color(.systemBackground))
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
            .padding(.horizontal)
            .frame(height: cardHeight)
            .onChange(of: pickerItem) { newItem in
                if let newItem = newItem {
                    Task {
                        if let data = try? await newItem.loadTransferable(type: Data.self),
                           let image = UIImage(data: data) {
                            selectedImage = image
                        }
                    }
                }
            }
            .sheet(isPresented: $showPicker) {
                PhotosPicker(
                    selection: $pickerItem,
                    matching: .images,
                    photoLibrary: .shared()
                ) {
                    Text("Select an Image")
                        .font(.headline)
                        .padding()
                }
            }
            .sheet(isPresented: $showPromptAlert) {
                TextAlert(promptText: $promptText)
            }
        }
    }

    // Enhance Text Function Placeholder
    private func enhanceText() {
        print("Enhance Text action triggered")
    }
}

struct TextAlert: View {
    @Binding var promptText: String

    var body: some View {
        VStack {
            TextField("Enter your prompt here", text: $promptText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Submit", action: {
                print("Prompt submitted: \(promptText)")
            })
            .padding(.top)
        }
        .padding()
        .frame(width: 300, height: 200)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

#Preview {
    NoteView()
}
