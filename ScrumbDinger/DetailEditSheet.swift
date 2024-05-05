//
//  DetailEditSheet.swift
//  ScrumbDinger
//
//  Created by Darian Mitchell  on 2024/5/4.
//

import SwiftUI

struct DetailEditSheet: View {
    @Binding var isPresentingEditView: Bool
    @Binding var scrum: DailyScrum
    @Binding var editingScrum: DailyScrum
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $editingScrum)
                .navigationTitle(scrum.title)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            isPresentingEditView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done") {
                            isPresentingEditView = false
                            scrum = editingScrum
                        }
                    }
                }
        }
    }
}

#Preview {
    DetailEditSheet(isPresentingEditView: .constant(true), scrum: .constant(DailyScrum.sampleData[0]), editingScrum: .constant(DailyScrum.emptyScrum))
}
