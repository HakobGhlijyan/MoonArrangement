//
//  File: TonightMoon.swift
//  Project: MoonArrangement
//  Target: MoonArrangement
//
//  Created by Hakob Ghlijyan on 11/13/26
//  Copyright © 2026 Hakob Ghlijyan. All rights reserved.
//  Confidential and proprietary.
//

import Foundation

// MARK: - TonightMoon

/// Данные о сегодняшней луне: название, освещённость, дни до полнолуния.
///
/// Tonight's moon data: title, illumination and days until the full moon.
nonisolated struct TonightMoon: Hashable, Sendable {

    // MARK: Properties

    /// Название состояния луны. / Title of the moon state.
    let title: String

    /// Освещённая доля диска, 0...1. / Illuminated fraction, 0...1.
    let illumination: Double

    /// Дней до полнолуния. / Days until the full moon.
    let daysToFullMoon: Int

    // MARK: Sample data

    /// Демонстрационные данные: «Nearly full», 78 %, 4 дня.
    /// Sample data: "Nearly full", 78%, 4 days.
    nonisolated static let sample = TonightMoon(
        title: "Nearly full",
        illumination: 0.78,
        daysToFullMoon: 4
    )
}
