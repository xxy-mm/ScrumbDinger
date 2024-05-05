//
//  ScrumStore.swift
//  ScrumbDinger
//
//  Created by Darian Mitchell  on 2024/5/5.
//

import Foundation

@MainActor
final class ScrumStore: ObservableObject {
    @Published var scrums: [DailyScrum] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("scrums.data")
    }
    
    func load() async throws {
        let task = Task<[DailyScrum], Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            let dailyScrums = try JSONDecoder().decode([DailyScrum].self, from: data)
            return dailyScrums
        }
        
        let scrums = try await task.value
        self.scrums = scrums
    }
    
    func save(scrum: [DailyScrum]) async throws {
        let task = Task {
            let outFile = try Self.fileURL()
            let data = try JSONEncoder().encode(scrums)
            try data.write(to: outFile)
        }
        
       _ = try await task.value
        
    }
    
}
