//
//  ImageThumbnail.swift
//  GoodLook
//
//  Created by Claudia Scognamiglio  on 18/12/24.
//


import SwiftUI

struct ImageThumbnail: View {
    let imageName: String
    var onDelete: () -> Void

    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .onLongPressGesture {
                    onDelete()
                }
        }
    }
}
