import SwiftUI
import PhotosUI

struct NoteView: View {
    @State private var noteText: String = "" // Text for the note
    @State private var selectedImage: UIImage? = nil // Holds the selected image
    @State private var pickerItem: PhotosPickerItem? = nil // PhotosPicker selection item
    @State private var showPicker: Bool = false // Tracks whether to show the picker
    @State private var showPromptAlert: Bool = false // Tracks if the prompt alert should be shown
    @State private var promptText: String = "" // Stores the prompt text

    var body: some View {
        VStack(spacing: 20) {
            // Section for the TextEditor
            VStack(alignment: .leading) {
                HStack {
                    Text("Your Notes")
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    // AI Button at the top-right corner
                    Menu {
                        Button("Enter Prompt", action: {
                            showPromptAlert = true // Show the prompt input sheet
                        })
                        
                        Button("Enhance Text", action: {
                            enhanceText()
                        })
                    } label: {
                        Image(systemName: "brain.head.profile")
                            .font(.system(size: 24))
                            .foregroundColor(.yellow)
                    }
                }
                
                ZStack(alignment: .topTrailing) {
                    TextEditor(text: $noteText)
                        .padding()
                        .frame(height: 150)
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                        )
                    
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
            .padding()
            
            // Section for "Attach Image"
            VStack(alignment: .leading) {
                HStack {
                    Text("Attach Image")
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    // Circular Add Image Button
                    Button(action: {
                        showPicker.toggle() // Trigger image picker
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
                    // Save action placeholder
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
            TextAlert(promptText: $promptText) // Show the TextAlert when the button is tapped
        }
    }

    // Enhance Text Function Placeholder
    private func enhanceText() {
        print("Enhance Text action triggered")
        // Add your text enhancement logic here
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
