//
//  ScrumsView.swift
//  ScrumbDinger
//
//  Created by Darian Mitchell  on 2024/4/24.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    @Environment(\.scenePhase) private var scenePhase
    let saveAction: () -> Void

    var body: some View {
        NavigationStack {
            if #available(iOS 17.0, *) {
                ScrumsList(scrums: $scrums)
                    .onChange(of: scenePhase) { old, new in
                        if old == .active, new == .inactive {
                            saveAction()
                        }
                    }
            } else {
                ScrumsList(scrums: $scrums)
                    .onChange(of: scenePhase) { phase in
                        if phase == .inactive {
                            saveAction()
                        }
                    }
            }
        }
    }
}

#Preview {
    ScrumsView(scrums: .constant(DailyScrum.sampleData)) {
    }
}
