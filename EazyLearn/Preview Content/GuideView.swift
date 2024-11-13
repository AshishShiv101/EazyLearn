import SwiftUI

struct GuideView: View {
    @State private var searchText: String = ""

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        HStack {
                            Image(systemName: "location.fill")
                                .foregroundColor(.white)
                            Text("Chennai")
                                .padding()
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(Color.black.opacity(0.7))
                        .cornerRadius(10)

                        // Search bar with icon
                        ZStack(alignment: .leading) {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .padding(.leading, 10)

                            TextField("Search", text: $searchText)
                                .padding(10)
                                .padding(.leading, 30)
                                .background(Color.white.opacity(0.8))
                                .cornerRadius(10)
                                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                        }
                        .frame(height: 40)
                        .padding(.leading, 8)
                    }
                    .padding()

             
                    ForEach(1...3, id: \.self) { index in
                        VStack(alignment: .leading) {
                            Text("Carousel \(index)")
                                .font(.headline)
                                .padding(.bottom, 5)

                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(spacing: 10) {
                                    ForEach(0..<5) { _ in
                                        Rectangle()
                                            .fill(Color.gray.opacity(0.3))
                                            .frame(width: 150, height: 100)
                                            .cornerRadius(10)
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                        .padding(.bottom, 20)
                    }

                    Text("More Content")
                        .font(.headline)
                        .padding(.vertical, 10)

                    HStack {
                        ForEach(0..<3) { index in
                            Button(action: {
                            }) {
                                Text("Button \(index + 1)")
                                    .frame(width: 100, height: 30)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(15)
                            }
                        }
                    }
                    .padding(.bottom, 20)

                    VStack(spacing: 10) {
                        ForEach(0..<5) { _ in
                            HStack {
                                ZStack {
                                    Rectangle()
                                        .fill(Color.gray.opacity(0.3))
                                        .frame(height: 100)
                                        .cornerRadius(10)

                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.black)
                                        .padding(.trailing, 10)
                                        .padding(.top, 10)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("Guide")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.top, 20)
        }
    }
}

#Preview {
    GuideView()
}
