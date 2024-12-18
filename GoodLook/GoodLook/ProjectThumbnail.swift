//
//  ProjectThumbnail.swift
//  GoodLook
//
//  Created by Claudia Scognamiglio  on 18/12/24.
//


import SwiftUI

struct ProjectThumbnail: View {
    let project: SavedProject
    var onRename: () -> Void
    var onDelete: () -> Void
    var onOpen: () -> Void
        

    var body: some View {
        VStack {
            Button(action: onOpen) {
                Image(uiImage: project.preview)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .cornerRadius(8)
            }

            Text(project.name)
                .font(.caption)
                .lineLimit(1)
                .onTapGesture {
                    onRename()
                }

            Button(role: .destructive, action: onDelete) {
                Text("Delete")
                    .font(.caption)
                    .foregroundColor(.red)
            }
        }
    }
}
