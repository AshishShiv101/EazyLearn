import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    HStack {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Ashish Shiv")
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            Text("Phone: +1 (234) 567-8901")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Image(systemName: "chevron.right") // Right arrow icon
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 4)
                    .padding(.horizontal, 20)
                    
                    // Buttons
                    VStack(spacing: 15) {
                        Button(action: {
                            // Action for Privacy Settings
                        }) {
                            HStack {
                                Image(systemName: "lock.shield")
                                    .foregroundColor(Color.yellow)
                                Text("Privacy Settings")
                                    .fontWeight(.semibold)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color.yellow)
                            }
                            .padding()
                            .background(Color.white)
                            .foregroundColor(Color.yellow)
                            .cornerRadius(12)
                            .shadow(color: Color.yellow.opacity(0.3), radius: 5, x: 0, y: 4)
                        }
                        
                        Button(action: {
                            // Action for Edit Contacts
                        }) {
                            HStack {
                                Image(systemName: "person.2")
                                    .foregroundColor(Color.yellow)
                                Text("Edit Contacts")
                                    .fontWeight(.semibold)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color.yellow)
                            }
                            .padding()
                            .background(Color.white)
                            .foregroundColor(Color.yellow)
                            .cornerRadius(12)
                            .shadow(color: Color.yellow.opacity(0.3), radius: 5, x: 0, y: 4)
                        }
                        
                        Button(action: {
                            // Action for Logout
                        }) {
                            HStack {
                                Image(systemName: "arrow.backward.circle")
                                    .foregroundColor(Color.red)
                                Text("Logout")
                                    .fontWeight(.semibold)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color.red)
                            }
                            .padding()
                            .background(Color.white)
                            .foregroundColor(Color.red)
                            .cornerRadius(12)
                            .shadow(color: Color.red.opacity(0.3), radius: 5, x: 0, y: 4)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    
                    Spacer() // Additional space at the bottom
                }
                .navigationBarTitleDisplayMode(.inline)
                .background(Color.yellow.opacity(0.05))
                .padding(.top, 20)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("Account")
                            .font(.headline)
                            .foregroundColor(.yellow)
                    }
                }
            }
            
        }
    }
}

#Preview {
    AccountView()
}
