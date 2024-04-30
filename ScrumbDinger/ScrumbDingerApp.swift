//
//  ScrumbDingerApp.swift
//  ScrumbDinger
//
//  Created by Darian Mitchell  on 2024/4/23.
//

import SwiftUI

@main
struct ScrumbDingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
