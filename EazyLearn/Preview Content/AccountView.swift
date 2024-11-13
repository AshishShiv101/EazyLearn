import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationView {
            ScrollView{
                VStack {
                    // Profile Image
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                    
                    // Name
                    Text("Ashish Shiv")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    // Phone Number
                    Text("Phone: +1 (234) 567-8901")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.top,-5)
                        .padding(.bottom,10)
                    
                    // Spacer
                    Spacer()
                    
                    // Gray buttons
                    VStack(spacing: 20) {
                        Button(action: {
                            // Action for edit
                        }) {
                            HStack {
                                Text("Edit Profile")
                                    .fontWeight(.semibold)
                                Spacer()
                                Image(systemName: "chevron.right") // Right arrow icon
                                    .foregroundColor(.white)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("BrandPrimary")) // Your accent color
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                        Button(action: {
                            // Action for Privacy Settings
                        }) {
                            
                            HStack {
                                Text("Privacy Settings")
                                Spacer()
                                Image(systemName: "chevron.right") // Right arrow icon
                                    .foregroundColor(.black)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.gray.opacity(0.3))
                            .foregroundColor(.black)
                            .cornerRadius(10)
                        }
                        
                        Button(action: {
                            // Action for Edit Contacts
                        }) {
                            HStack {
                                Text("Edit Contacts")
                                Spacer()
                                Image(systemName: "chevron.right") // Right arrow icon
                                    .foregroundColor(.black)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.gray.opacity(0.3))
                            .foregroundColor(.black)
                            .cornerRadius(10)
                        }
                        
                        Button(action: {
                            // Action for Logout
                        }) {
                            HStack {
                                Text("Logout")
                                Spacer()
                                Image(systemName: "chevron.right") // Right arrow icon
                                    .foregroundColor(.black)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.gray.opacity(0.3))
                            .foregroundColor(.black)
                            .cornerRadius(10)
                        }
                        
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 80)
                    
                    Spacer() // Additional space at the bottom
                }
                .navigationTitle("Account")
                .navigationBarTitleDisplayMode(.inline)
                .padding()
            }
        }
    }
}

#Preview {
    AccountView()
}
