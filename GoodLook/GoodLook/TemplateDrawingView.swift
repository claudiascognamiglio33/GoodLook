//
//  TemplateDrawingView.swift
//  GoodLook
//
//  Created by Claudia Scognamiglio  on 18/12/24.
//


import SwiftUI
import PencilKit

struct TemplateDrawingView: View {
    let templateImageName: String
    var existingProject: SavedProject?

    @State private var canvasView = PKCanvasView()
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            if let existingProject = existingProject {
                Image(uiImage: existingProject.preview)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            } else {
                Image(templateImageName)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }

            CanvasRepresentable(canvasView: $canvasView)
                .ignoresSafeArea()
        }
        .navigationTitle(existingProject?.name ?? "Draw")
        .onDisappear {
            saveDrawing()
        }
    }

    func saveDrawing() {
        let drawingImage = canvasView.drawing.image(from: canvasView.bounds, scale: UIScreen.main.scale)
        _ = existingProject?.name ?? templateImageName
        ImageStore.saveImage(drawingImage, category: templateImageName)
    }
}
