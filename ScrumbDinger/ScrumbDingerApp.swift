//
//  ScrumbDingerApp.swift
//  ScrumbDinger
//
//  Created by Darian Mitchell  on 2024/4/23.
//

import SwiftUI

@main
struct ScrumbDingerApp: App {
    @StateObject private var store = ScrumStore()
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $store.scrums) {
                Task {
                    do {
                        try await store.save(scrum: store.scrums)
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
            }
            .task {
                do {
                    try await store.load()
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
        }
    }
}
