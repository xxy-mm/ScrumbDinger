//
//  ScrumsView.swift
//  ScrumbDinger
//
//  Created by Darian Mitchell  on 2024/4/24.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    @State private var isPresentingNewScrumView = false
    
    var body: some View {
        NavigationStack {
            List($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button {
                    isPresentingNewScrumView = true
                } label: {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
            .sheet(isPresented: $isPresentingNewScrumView, content: {
                NewScrumSheet(isPresentingNewScrumView: $isPresentingNewScrumView, scrums: $scrums)
            })
        }
    }
}

#Preview {
    ScrumsView(scrums: .constant(DailyScrum.sampleData))
}
