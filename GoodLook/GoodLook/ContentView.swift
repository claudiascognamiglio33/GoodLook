//
//  ContentView.swift
//  GoodLook
//
//  Created by Claudia Scognamiglio  on 13/12/24.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("abstract_background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack(spacing: 16) {
                    Text("GoodLook")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)

                    NavigationLink(destination: CategoriesView()) {
                        Text("Get Started")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.pink)
                            .cornerRadius(8)
                    }
                    .frame(width: 180, height: 44)

                    Text("good luck with your look!")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()
                .frame(width: 300, height: 300)
                .background(Color.white)
                .cornerRadius(16)
                .shadow(radius: 10)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
