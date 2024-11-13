import SwiftUI

struct ContactView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HStack {
                    Text("Mom")
                        .font(.headline)
                        .padding()
                    
                    Spacer()
                    
                    Button(action: {
                       
                    }) {
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 40, height: 40)
                            .overlay(
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                            )
                    }
                }
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(8)
                .padding(.top, 30)
                .padding(.horizontal, 20)

                HStack {
                    Text("Dad")
                        .font(.headline)
                        .padding()
                    
                    Spacer()
                    
                    Button(action: {
                    }) {
                        Circle()
                            .fill(Color.green)
                            .frame(width: 40, height: 40)
                            .overlay(
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                            )
                    }
                }
                .padding()
                .background(Color.green.opacity(0.1))
                .cornerRadius(8)
                .padding(.horizontal, 20)

                HStack {
                    Button(action: {
                       
                    }) {
                        Text("Add Contacts")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    
                    Spacer().frame(width: 20)
                    
                    Button(action: {
                       
                    }) {
                        Text("Edit")
                            .padding()
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                
                Spacer()
            }
            .navigationTitle("Contacts")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContactView()
}
