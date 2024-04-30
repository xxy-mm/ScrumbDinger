//
//  ThemeView.swift
//  ScrumbDinger
//
//  Created by Darian Mitchell  on 2024/4/30.
//

import SwiftUI

struct ThemeView: View {
    let theme: Theme
    
    var body: some View {
        Text(theme.name)
            .padding(4)
            .frame(maxWidth: .infinity)
            .background(theme.mainColor)
            .foregroundStyle(theme.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 4))
        
    }
}

#Preview {
    ThemeView(theme: .buttercup)
}
