//
//  TemplatesListView.swift
//  GoodLook
//
//  Created by Claudia Scognamiglio  on 18/12/24.
//


import SwiftUI

struct TemplatesListView: View {
    let templates = [
        "Tops and Shirts", "Pants", "Skirts", "Dresses", "Coord-Sets",
        "Coats", "Sport", "Shoes", "Accessories", "Empty"
    ]

    var body: some View {
        NavigationView {
            List(templates, id: \.self) { template in
                NavigationLink(destination: TemplateDrawingView(templateImageName: template)) {
                    HStack {
                        
                        Text(template)
                            .foregroundStyle(.pink)
                            
                            .tint(.pink)
                    }
                }
            }
            .navigationTitle("Choose a Template")
            
            
            

        }
    }
}
