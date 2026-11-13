//
//  File: SideBySideArrangementViewStyle.swift
//  Project: MoonArrangement
//  Target: MoonArrangement
//
//  Created by Hakob Ghlijyan on 11/13/26
//  Copyright © 2026 Hakob Ghlijyan. All rights reserved.
//  Confidential and proprietary.
//

import SwiftUI

// MARK: - SideBySideArrangementViewStyle

/// Собственный стиль раскладки: split только по горизонтали («рядом»).
///
/// Самое прямое применение кастомного стиля — дать имя настроенной раскладке,
/// чтобы использовать её на нескольких экранах. Стиль передаёт виды встроенному стилю
/// через `ArrangementView(configuration)`. Если же разложить `configuration.primary`/`secondary`
/// самому (например, в `VStack`), реакция на сгиб пропадёт, а `splitArrangementAxis` станет `nil`.
///
/// A custom arrangement style: a split restricted to the horizontal axis ("side by side").
///
/// The most direct use of a custom style is naming a configured arrangement so several screens
/// can share it. The style forwards the views to a built-in style via `ArrangementView(configuration)`.
/// Laying out `configuration.primary`/`secondary` yourself (say, in a `VStack`) loses the fold
/// handling, and `splitArrangementAxis` becomes `nil`.
struct SideBySideArrangementViewStyle: ArrangementViewStyle {

    // MARK: ArrangementViewStyle

    func makeBody(configuration: Configuration) -> some View {
        ArrangementView(configuration)
            .arrangementViewStyle(.split.axes(.horizontal))
    }
}

// MARK: - Static member lookup

extension ArrangementViewStyle where Self == SideBySideArrangementViewStyle {

    /// Стиль «рядом»: `.arrangementViewStyle(.sideBySide)`.
    /// The side-by-side style: `.arrangementViewStyle(.sideBySide)`.
    static var sideBySide: SideBySideArrangementViewStyle { .init() }
}
