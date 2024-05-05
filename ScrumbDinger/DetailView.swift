//
//  DetailView.swift
//  ScrumbDinger
//
//  Created by Darian Mitchell  on 2024/4/30.
//

import SwiftUI

struct DetailView: View {
    @Binding var scrum: DailyScrum
    
    @State private var editingScrum = DailyScrum.emptyScrum
    @State private var isPresentingEditView = false
    
    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                NavigationLink(destination: MeetingView(scrum: $scrum)) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                    .foregroundStyle(Color.accentColor)
                }
                
                HStack{
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                        .padding(4)
                        .background(scrum.theme.mainColor)
                        .foregroundStyle(scrum.theme.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }
                .accessibilityElement(children: .combine)
            }
            
            Section("Attendees") {
                ForEach(scrum.attendees){ attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
        }
        .navigationTitle(scrum.title)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                editingScrum = scrum
            }
        }
        .sheet(isPresented: $isPresentingEditView, content: {
            DetailEditSheet(isPresentingEditView: $isPresentingEditView, scrum: $scrum, editingScrum: $editingScrum)
        })
    }
}

#Preview {
    NavigationStack {
        DetailView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}
