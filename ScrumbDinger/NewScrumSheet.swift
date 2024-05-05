//
//  NewScrumSheet.swift
//  ScrumbDinger
//
//  Created by Darian Mitchell  on 2024/5/4.
//

import SwiftUI

struct NewScrumSheet: View {
    @State private var newScrum = DailyScrum.emptyScrum
    @Binding var isPresentingNewScrumView: Bool
    @Binding var scrums: [DailyScrum]
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $newScrum)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewScrumView = false
                        }
                    }
                    
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            scrums.append(newScrum)
                            isPresentingNewScrumView = false
                        }
                    }
                }
        }
    }
}

#Preview {
    NavigationStack {
        NewScrumSheet(isPresentingNewScrumView: .constant(true), scrums: .constant(DailyScrum.sampleData))
    }
}
