//
//  File: MoonScreenContainer.swift
//  Project: MoonArrangement
//  Target: MoonArrangement
//
//  Created by Hakob Ghlijyan on 11/13/26
//  Copyright © 2026 Hakob Ghlijyan. All rights reserved.
//  Confidential and proprietary.
//

import SwiftUI

// MARK: - MoonScreenContainer

/// Общая оболочка демо-экранов: `NavigationStack`, заголовок «Moon» и ночной фон.
///
/// `ArrangementView` отвечает только за раскладку и не даёт навигации, поэтому стек
/// находится снаружи, а не внутри него (так рекомендует Apple).
///
/// Shared shell for demo screens: `NavigationStack`, the "Moon" title and the night background.
///
/// `ArrangementView` handles layout only and provides no navigation, so the stack lives
/// outside of it rather than inside (as Apple recommends).
struct MoonScreenContainer<Content: View>: View {

    // MARK: Properties

    /// Заголовок навигации. / Navigation title.
    var title: LocalizedStringKey = "Moon"

    /// Содержимое экрана. / Screen content.
    @ViewBuilder var content: Content

    // MARK: Body

    var body: some View {
        NavigationStack {
            content
                .background { NightSkyBackground().ignoresSafeArea() }
                .navigationTitle(title)
                .navigationBarTitleDisplayMode(.inline)
                .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
}

// MARK: - Preview

#Preview("MoonScreenContainer - Light") {
    MoonScreenContainer {
        TonightView()
    }
    .preferredColorScheme(.light)
}

#Preview("MoonScreenContainer - Dark") {
    MoonScreenContainer {
        TonightView()
    }
    .preferredColorScheme(.dark)
}
