//
//  ChooseProjectView.swift
//  GoodLook
//
//  Created by Claudia Scognamiglio  on 18/12/24.
//


import SwiftUI

struct ChooseProjectView: View {
    let template: String

    var body: some View {
        VStack {
            Text("Choose Project")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            Text("Selected Template: \(template)")
                .font(.title2)
                .foregroundColor(.gray)

            Spacer()

            Text("Project-specific content goes here.")
                .padding()
        }
        .navigationTitle("Project")
    }
}

struct ChooseProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseProjectView(template: "Template 1")
    }
}

