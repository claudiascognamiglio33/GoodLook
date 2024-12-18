//
//  CategoryDetailView.swift
//  GoodLook
//
//  Created by Claudia Scognamiglio  on 18/12/24.
//


import SwiftUI

struct CategoryDetailView: View {
    let categoryName: String
    @State private var savedProjects: [SavedProject] = []
    @State private var isRenaming = false
    @State private var selectedProject: SavedProject?
    @State private var newName = ""

    var body: some View {
        VStack {
            if savedProjects.isEmpty {
                Text("No projects yet in \(categoryName)")
                    .foregroundColor(.gray)
            } else {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 16) {
                        ForEach(savedProjects) { project in
                            ProjectThumbnail(
                                project: project,
                                onRename: { renameProject(project) },
                                onDelete: { deleteProject(project) },
                                onOpen: { openProject(project) }
                            )
                        }
                    }
                    .padding()
                }
            }
        }
        .onAppear {
            loadSavedProjects()
        }
        .sheet(item: $selectedProject) { project in
            TemplateDrawingView(
                templateImageName: project.name,
                existingProject: project
            )
        }
        .alert("Rename Project", isPresented: $isRenaming) {
        }
        .navigationTitle(categoryName)
    }

    func loadSavedProjects() {
        savedProjects = ImageStore.loadProjects(for: categoryName)
    }

    func deleteProject(_ project: SavedProject) {
        ImageStore.deleteProject(project)
        loadSavedProjects()
    }

    func renameProject(_ project: SavedProject) {
        selectedProject = project
        newName = project.name
        isRenaming = true
    }

    func openProject(_ project: SavedProject) {
        selectedProject = project
    }
}
