//
//  File: MoonPalette.swift
//  Project: MoonArrangement
//  Target: MoonArrangement
//
//  Created by Hakob Ghlijyan on 11/13/26
//  Copyright © 2026 Hakob Ghlijyan. All rights reserved.
//  Confidential and proprietary.
//

import SwiftUI

// MARK: - MoonPalette

/// Цвета ночного экрана. Экран всегда тёмный, поэтому цвета фиксированы.
///
/// Night-screen colors. The screen is always dark, so the colors are fixed.
nonisolated enum MoonPalette {

    /// Верх неба. / Top of the sky.
    static let skyTop = Color(red: 0.03, green: 0.04, blue: 0.12)

    /// Низ неба. / Bottom of the sky.
    static let skyBottom = Color(red: 0.16, green: 0.12, blue: 0.34)

    /// Освещённая часть луны. / Lit part of the moon.
    static let moonLight = Color(red: 0.93, green: 0.90, blue: 0.80)

    /// Центр освещённой части (светлее). / Center of the lit part (brighter).
    static let moonCore = Color(red: 0.99, green: 0.96, blue: 0.88)

    /// Тень на диске. / Shadow side of the disc.
    static let moonShadow = Color(red: 0.11, green: 0.13, blue: 0.22)

    /// Основной текст. / Primary text.
    static let primaryText = Color.white

    /// Вторичный текст. / Secondary text.
    static let secondaryText = Color.white.opacity(0.6)

    /// Фон карточек. / Card background.
    static let cardFill = Color.white.opacity(0.1)
}
