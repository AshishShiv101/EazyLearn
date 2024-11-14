import SwiftUI

struct ShareView: View {
    @State private var searchText = ""
    @State private var contacts = [
        "John Doe",
        "Jane Smith",
        "Ashish Shiv",
        "Emma Wilson",
        "Michael Brown",
        "Olivia Taylor",
        "Liam Davis",
        "Sophia White"
    ]
    
    var filteredContacts: [String] {
        if searchText.isEmpty {
            return contacts
        } else {
            return contacts.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.yellow)
                    TextField("Search contacts", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(8)
                        .background(Color.yellow.opacity(0.1))
                        .cornerRadius(8)
                }
                .padding(.horizontal, 16)
                
                List(filteredContacts, id: \.self) { contact in
                    HStack {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.yellow)
                           
                        Text(contact)
                            .font(.headline)
                           
                        
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.yellow)
                    }
                    .padding(.vertical, 8)
                    .cornerRadius(8)
                    .shadow(color: Color.yellow.opacity(0.15), radius: 4, x: 0, y: 2)
                }
                .listStyle(InsetGroupedListStyle())
                .scrollContentBackground(.hidden)
            }
            .padding(.top, 10)
            .background(Color.yellow.opacity(0.05).edgesIgnoringSafeArea(.all))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Community Chat")
                        .font(.headline)
                        .foregroundColor(.yellow)
                }
            }
        }
    }
}

#Preview {
    ShareView()
}
