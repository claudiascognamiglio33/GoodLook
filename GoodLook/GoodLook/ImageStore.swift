//
//  ImageStore.swift
//  GoodLook
//
//  Created by Claudia Scognamiglio  on 18/12/24.
//

import SwiftUI

struct SavedProject: Identifiable {
    let id = UUID()
    var name: String
    let preview: UIImage
    let category: String
}

class ImageStore {
    static func saveImage(_ image: UIImage, category: String) {
        let imageName = UUID().uuidString + ".png"
        let project = SavedProject(name: imageName, preview: image, category: category)
        saveProject(project)
    }

    static func saveProject(_ project: SavedProject) {
        let directory = getDirectory(for: project.category)
        let fileURL = directory.appendingPathComponent(project.name)
        if let data = project.preview.pngData() {
            try? data.write(to: fileURL)
        }
    }

    static func loadProjects(for category: String) -> [SavedProject] {
        let directory = getDirectory(for: category)
        guard let fileNames = try? FileManager.default.contentsOfDirectory(atPath: directory.path) else {
            return []
        }

        return fileNames.compactMap { fileName in
            let fileURL = directory.appendingPathComponent(fileName)
            guard let image = UIImage(contentsOfFile: fileURL.path) else {
                return nil
            }
            return SavedProject(name: fileName, preview: image, category: category)
        }
    }

    static func deleteProject(_ project: SavedProject) {
        let directory = getDirectory(for: project.category)
        let fileURL = directory.appendingPathComponent(project.name)
        try? FileManager.default.removeItem(at: fileURL)
    }

    static func renameProject(_ project: SavedProject, newName: String) {
        let directory = getDirectory(for: project.category)
        let oldURL = directory.appendingPathComponent(project.name)
        let newURL = directory.appendingPathComponent(newName)
        try? FileManager.default.moveItem(at: oldURL, to: newURL)
    }

    private static func getDirectory(for category: String) -> URL {
        let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent(category)
        try? FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
        return directory
    }
}

