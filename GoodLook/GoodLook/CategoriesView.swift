//
//  CategoriesView.swift
//  GoodLook
//
//  Created by Claudia Scognamiglio  on 13/12/24.
//

// CategoriesView.swift
import SwiftUI

struct CategoriesView: View {
    @State private var showTemplates = false
    let categories = [
        "Tops and Shirts", "Pants", "Skirts", "Dresses", "Coord-Sets",
        "Coats", "Sport", "Shoes", "Accessories", "Empty"
    ]

    var body: some View {
        ZStack {
            Image("abstract_background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 16) {
                VStack(spacing: 16) {
                    Text("GoodLook")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.pink)

                    Button(action: {
                        showTemplates.toggle()
                    }) {
                        Text("Choose a Template")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.pink)
                            .cornerRadius(8)
                    }
                    .frame(width: 200, height: 44)
                }
                .padding()
                .frame(width: 300, height: 200)
                .background(Color.white)
                .cornerRadius(16)
                .shadow(radius: 10)

                ScrollView {
                    VStack(alignment: .center, spacing: 16) {
                        Text("Categories")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .tint(.white)
                            .shadow(radius: 5)
                            .padding(.leading)

                        ForEach(categories, id: \.self) { category in
                            NavigationLink(destination: CategoryDetailView(categoryName: category)) {
                                Text(category)
                                    .padding()
                                    .frame(width: 300, height: 60)
                                    .background(Color.white)
                                    .tint(.pink)
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                                    .padding(.horizontal)
                                    .frame(alignment: .center)
                            }
                        }
                    }
                }
                .padding(.top)
            }
        }
        .sheet(isPresented: $showTemplates) {
            TemplatesListView()
        }
        .navigationBarBackButtonHidden(true)
    }
        
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
